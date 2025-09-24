package terraform.gcp.security.google_kms.google_kms_key_handle.approved_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_key_handle.vars

conditions := [
    [
    {"situation_description" : "Key handle must have an approved location",
    "remedies":[ "Change the location of key-handle to an approved location"]},
    {
        "condition": "Check the location of the key_handle",
        "attribute_path" : ["location"], 
        "values" : ["australia-east1"], 
        "policy_type" : "whitelist" 
    }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message

