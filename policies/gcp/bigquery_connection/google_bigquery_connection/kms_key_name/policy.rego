package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name
import data.terraform.helpers 
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [
    [
        {"situation_description" : "There has not been kms_key used for encryption or is formatted incorrectly",
        "remedies":["Assign a kms_key_name for encryption and ensure that it is formatted correctly to be in Australia"]
        },
        {
            "condition": "Check for the creation of kms_key_name",
            "attribute_path" : ["kms_key_name"], 
            "values" : ["", null], 
            "policy_type" : "blacklist" 
        },
    ]
    [
        
        {
            "condition": "Check that is formatted for Australia",
            "attribute_path" : ["kms_key_name"], 
            "values" : ["AUSTRALIA-SOUTHEAST1", "AUSTRALIA-SOUTHEAST2"], 
            "policy_type" : "whitelist" 
        },
    ]
]

    
# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
