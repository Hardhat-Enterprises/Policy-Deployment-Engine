package terraform.gcp.security.bigquery_connection.google_bigquery_connection.kms_key_name
import data.terraform.gcp.helpers 
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [
    [
        {"situation_description" : "There has not been kms_key used for encryption",
        "remedies":["Assign a kms_key_name for encryption"]
        },
        {
            "condition": "Check for the creation of kms_key_name",
            "attribute_path" : ["kms_key_name"], 
            "values" : ["", null], 
            "policy_type" : "blacklist" 
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
