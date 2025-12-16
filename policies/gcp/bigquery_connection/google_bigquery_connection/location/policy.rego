package terraform.gcp.security.bigquery_connection.google_bigquery_connection.location 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Connection has been made from outside Australia",
    "remedies":["Ensure that connection is made from australia"]},
    {
        "condition": "Check to see if connection is made from valid region",
        "attribute_path" : ["location"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["AUSTRALIA-SOUTHEAST1", "AUSTRALIA-SOUTHEAST2"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

    


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details