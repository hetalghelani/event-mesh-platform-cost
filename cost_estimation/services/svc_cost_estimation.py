from google.cloud import firestore
from services.util import query_builder as qb

import google.cloud.logging

# This function returns the monthly infra cost per broker for given site
def get_monthly_broker_cost(site, geographicLocation):

    # Create an instance of FirestoreQueryBuilder
    query_builder = qb.FirestoreQueryBuilder(collection="EVENTM_effectiveBrokerCost")

    # Build the query filters
    query_filters = [
        {"field": "infoStatus", "operator": "==", "value": "latest"},
        {"field": "cloudProvider", "operator": "==", "value": site},
        {"field": "geographicLocation", "operator": "==", "value": geographicLocation}
    ]

    query_builder.build_query_filters(query_filters)

    # Execute the query and get the results
    results = query_builder.get()

    if results == []:
        raise Exception(f"Missing : No document found with 'infoStatus'='latest' for site={site}, geographicLocation={geographicLocation}")

    return results

def get_max_connection_capacity(in_connection, out_connection):
    capacity_collection = "EVENTM_brokerCapacity"

    # Create an instance of FirestoreQueryBuilder
    query_builder = qb.FirestoreQueryBuilder(collection=capacity_collection)

    # Build the query filters
    query_filters = []

    if not in_connection or not out_connection:
        raise Exception(f"Missing inboundConnections or outboundConnections in request query parameters. Please provide both inboundConnections and outboundConnections.")
         

    if (in_connection + out_connection) < 1000:
        query_filters = [
            {"field": "class", "operator": "==", "value": "1K"}
        ]
    elif (in_connection + out_connection) > 1000 and  (in_connection + out_connection) < 5000:
        query_filters = [
            {"field": "class", "operator": "==", "value": "5K"}
        ]
    elif (in_connection + out_connection) < 10000:
        query_filters = [
            {"field": "class", "operator": "==", "value": "10K"}
        ]
    else:
        raise Exception(f"Invalid connections request. Currently, we don't allow more than 10K connections.")
    
    query_builder.build_query_filters(query_filters)

    # Execute the query and get the results
    results = query_builder.get()

    maxInboundConnections = results[0].to_dict().get('inboundConnections')
    maxOutboundConnections = results[0].to_dict().get('outboundConnections')

    return maxInboundConnections, maxOutboundConnections