package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

conditions := [
    [
        {"situation_description" : "Resource location is not compliant.",
        "remedies":[ "Set location to an approved one only."]},
        {
            "condition": "Check if location is allowed",
            "attribute_path" : ["location"], 
            "values" : ["australia-southeast1", "australia-southeast2"], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details