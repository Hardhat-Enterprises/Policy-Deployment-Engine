package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_enforce_cmek_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

conditions := [
    [
    {"situation_description" : "Resource cmek_key_name is not compliant.",
    "remedies":[ "Set cmek_key_name to org-approved key"]},
    {
        "condition": "Check if key name is allowed",
        "attribute_path" : ["config",0,"cmek_key_name"], 
        "values" : ["projects/PDE/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details