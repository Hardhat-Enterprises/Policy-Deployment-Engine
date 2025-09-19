package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.disable_search

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

conditions := [
    [
    {"situation_description" : "Resource disable_search is not compliant.",
    "remedies":[ "Set disable_search to TRUE only"]},
    {
        "condition": "Check if disable_search is set to TRUE",
        "attribute_path" : ["config",0,"disable_search"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details