package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql.type # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Require explicit supported Cloud SQL type",
    "remedies":[ "Set cloud_sql.type to POSTGRES or MYSQL" ]},
    {
        "condition": "cloud_sql.type must be one of the approved values",
        "attribute_path" : ["cloud_sql", 0, "type"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["POSTGRES","MYSQL"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
