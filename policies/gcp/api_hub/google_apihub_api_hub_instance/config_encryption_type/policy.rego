package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_encryption_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

conditions := [
    [
    {"situation_description" : "Resource encryption_type is not compliant.",
    "remedies":[ "Set encryption_type to CMEK only"]},
    {
        "condition": "Check if encryption_type is allowed",
        "attribute_path" : ["config",0,"encryption_type"], 
        "values" : ["CMEK"], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details