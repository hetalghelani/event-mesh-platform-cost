from google.cloud import firestore
from flask import Request, jsonify

import os
import json
import logging
import google.cloud.logging
import functions_framework

def get_document_by_id(id, collection):

    db = firestore.Client()

    collection_name = collection
    #os.environ['EFFECTIVE_BROKER_COST']

    collection_ref = db.collection(collection_name)

    return collection_ref.document(id).get().to_dict()

# This function returns the monthly infra cost per broker for given site
def get_monthly_broker_cost(request):

    data = request.json

    site = data.get('site')
    env = data.get('environment')

    if site in ["gcp","aks","dc8"]:
        zone = "eu"
    elif site in ["dc9","ali"]:
        zone = "cn"
    else:
        raise Exception (f"Invalid site. Only sites allowed are ['gcp','aks','dc8','dc9','ali']")
    

    id = (site + '_' + env + '_' + zone)
    
    collection = "EVENTM_effectiveBrokerCost"
    #os.environ['EFFECTIVE_BROKER_COST']    

    return get_document_by_id(id, collection)['cost']


def cost_estimation_algorithm_get(request, in_connection, out_connection):

    capacity_collection = "EVENTM_brokerCapacity"

    broker_cost = get_monthly_broker_cost(request)

    if (in_connection + out_connection) < 1000:
        id = "1K"
    elif (in_connection + out_connection) > 1000 and  (in_connection + out_connection) < 5000:
        id = "5K"
    elif (in_connection + out_connection) < 10000:
        id = "10K"

    doc = get_document_by_id(id, capacity_collection)

    return (in_connection/doc.get('inboundConnections') + out_connection/doc.get('outboundConnections')) * broker_cost


def handle_get_cost(request, headers):
    match request.path:
        # Team check API
        case "/cost/estimation":
            logging.debug(
                json.dumps(
                    {"request.path": request.path, "request.args": request.args}, default=str
                )
            ) 
            data = request.json

            in_connection = data.get('inboundConnections')
            out_connection = data.get('outboundConnections')

            cost = cost_estimation_algorithm_get(request, in_connection, out_connection)

            response = jsonify(
                {
                    "environment": data.get('environment'),
                    "site": data.get('site'),
                    "cost": cost,
                    "inboundConnections": data.get('inboundConnections'),
                    "outboundConnections": data.get('outboundConnections'),
                }
            )            
            logging.debug(f"get_cost/cost/estimation: Sending response: {response}")
            return (response, 200, headers)             
        # Not a matching path
        case _:
            return ("Not Found", 404)                      

        
@functions_framework.http
def get_cost(request: Request):
    #setup_logger()

    match request.method:
        # GCF preflight
        case "OPTIONS":
            headers = {
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "GET",
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Max-Age": "3600",
            }

            return ("", 204, headers)

        case "GET":
            headers = {"Access-Control-Allow-Origin": "*"}
            return handle_get_cost(request, headers)

        # Not an allowed HTTP method
        case _:
            return ("Method Not Allowed", 405)