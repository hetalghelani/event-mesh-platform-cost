from google.cloud import firestore
from flask import Request, jsonify

import os
import json
import logging
import google.cloud.logging
import functions_framework

from services import svc_cost_estimation as ces

def cost_estimation_algorithm(broker_cost, in_connection, out_connection, maxInboundConnections, maxOutboundConnections):

    if maxInboundConnections == 0 or maxOutboundConnections == 0:
        return (f"Invalid maxInboundConnections or maxOutboundConnections. Cannot divide by 0.")
    else:
        cost = (in_connection/maxInboundConnections + out_connection/maxOutboundConnections) * broker_cost
        return cost

def handle_get_cost(request, headers):
    match request.path:
    
        case "/cost/estimation":
            logging.debug(
                json.dumps(
                    {"request.path": request.path, "request.args": request.args}, default=str
                )
            )        

            response, code = check_query_params(request)
            if code != 200:
                return (response, code, headers)

            in_connection = int(request.args.get('inboundConnections'))
            out_connection = int(request.args.get('outboundConnections'))
            site = request.args.get('site')
            geographicLocation = request.args.get('geographicLocation')

            cost = {}

            try:
                maxInboundConnections, maxOutboundConnections = ces.get_max_connection_capacity(in_connection, out_connection)
            except Exception as e:
                error_message = f"Error occurred while getting max connection capacity: {str(e)}"
                logging.error(error_message)
                if 'Invalid' in str(e) or 'Missing' in str(e):
                    response = jsonify({"error": str(e)})
                    status_code = 400
                    return (response, status_code, headers)
                else:
                    response = jsonify({"error": "Internal Server Error"})
                    status_code = 500
                    return (response, status_code, headers)

            try:
                doc_broker_cost = ces.get_monthly_broker_cost(site, geographicLocation)
                for doc in doc_broker_cost:
                        broker_cost = doc.to_dict()['cost']
                        env = doc.to_dict()['environment']
                        cost.update({env : cost_estimation_algorithm(broker_cost, in_connection, out_connection, maxInboundConnections, maxOutboundConnections)})
            except Exception as e:
                error_message = f"Error occurred while getting monthly broker cost: {str(e)}"
                logging.error(error_message)
                if 'Invalid' in str(e) or 'Missing' in str(e):
                    response = jsonify({"error": str(e)})
                    status_code = 400
                    return (response, status_code, headers)
                else:
                    response = jsonify({"error": "Internal Server Error"})
                    status_code = 500
                    return (response, status_code, headers)
                    

            response = jsonify(
                {
                    "site": request.args.get('site'),
                    "cost": cost,
                    "inboundConnections": in_connection,
                    "outboundConnections": out_connection
                }
            )            
            logging.debug(f"get_cost/cost/estimation: Sending response: {response}")
            return (response, 200, headers)             
        # Not a matching path
        case _:
            return ("Not Found", 404)                      

def check_query_params(request):

    expected_params = ['site', 'inboundConnections', 'outboundConnections', 'geographicLocation']

    message = ""
    status_code = 200

    for param in expected_params:
        if request.args.get(param) == None:
            message = f"Missing {param} in request query parameters. Please provide {param}."
            status_code = 400
            logging.error(message)

    allowed_sites = ['gcp', 'aks', 'dc8', 'dc7', 'dc9', 'ali']

    if request.args.get('site') !='' and request.args.get('site') not in allowed_sites:
        message = f"Invalid site. Allowed sites are {allowed_sites}"
        status_code = 400        
        logging.error(message)               
    elif request.args.get('site') == '':
        message = f"Missing value for site in request query parameters. Please provide site."
        status_code = 400       
        logging.error(message)

    if request.args.get('geographicLocation') == '':
        message = f"Missing geographicLocation in request query parameters. Please provide geographicLocation."
        logging.error(message)
        status_code = 400            
    elif request.args.get('geographicLocation') not in ['eu', 'cn']:
        message = f"Invalid geographicLocation. Allowed geographicLocations are eu, cn"
        logging.error(message)
        status_code = 400

    return message, status_code

@functions_framework.http
def get_cost(request: Request):
    #setup_logger()

    match request.method:

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