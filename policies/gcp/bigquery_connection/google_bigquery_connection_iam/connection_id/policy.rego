package terraform.gcp.security.bigquery_connection.google_bigquery_connection_iam.connection_id 
import data.terraform.gcp.helpers 
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection_iam.vars

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

    
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details