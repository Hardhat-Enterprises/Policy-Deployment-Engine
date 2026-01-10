package terraform.gcp.security.bigquery_connection.google_bigquery_connection_iam.connection_id 
import data.terraform.helpers 
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection_iam.vars

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "An invalid member is accessing a connection",
    "remedies":["Ensure that a valid email of the organisation is accessing the connection"]},
    {
        "condition": "Check that a member is accessing the connection",
        "attribute_path" : ["member"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["@member.com"], # Values to compare against
        "policy_type" : "pattern whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

    
summary := data.terraform.gcp.helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

detail := summary.details