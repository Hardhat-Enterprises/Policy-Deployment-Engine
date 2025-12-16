package terraform.gcp.security.bigquery_connection.google_bigquery_connection.connection_id 
import data.terraform.gcp.helpers 
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "There has been no connection id created and assigned for the given connection",
    "remedies":["Ensure that a connection id has been assigned"]},
    {
        "condition": "Check for the creation of the value for the connection id",
        "attribute_path" : ["connection_id"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [""], # Values to compare against
        "policy_type" : "blacklist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

    
summary := data.terraform.gcp.helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

detail := summary.details