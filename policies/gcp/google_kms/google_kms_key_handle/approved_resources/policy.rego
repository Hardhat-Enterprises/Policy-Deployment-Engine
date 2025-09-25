package terraform.gcp.security.google_kms.google_kms_key_handle.approved_resources
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_key_handle.vars

conditions := [
    [
    {"situation_description" : "Key handle must have an approved location",
    "remedies":[ "Change the location of key-handle to an approved location"]},
    {
        "condition": "Check the location of the key_handle",
        "attribute_path" : ["resource_type_selector"], 
        "values" : ["storage.googleapis.com/Bucket","bigquery.googleapis.com/Dataset","sqladmin.googleapis.com/Instance"], 
        "policy_type" : "whitelist" 
    },
    ],

    [
    {"situation_description" : "Trying to access keys to sensitive resources from untrusted location",
    "remedies":[ "Try moving to a complaint location to access the resources"]},
    {
        "condition": "Check the location of the key_handle",
        "attribute_path" : ["location"], 
        "values" : ["europe-east1"], 
        "policy_type" : "blacklist" 
    },
    {
        "condition": "Check the location of the key_handle",
        "attribute_path" : ["resource_type_selector"], 
        "values" : ["bigquery.googleapis.com/Dataset","sqladmin.googleapis.com/Instance"], 
        "policy_type" : "blacklist" 
    }
    ]
]
    

message := helpers.get_multi_summary(conditions, vars.variables).message

