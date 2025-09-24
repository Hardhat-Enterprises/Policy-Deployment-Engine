package terraform.gcp.security.api_hub.google_apihub_plugin.allowed_service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin.vars

conditions := [
    [
        {"situation_description" : "Check service_account matches whitelist",
        "remedies":[ "Use valid service account"]},
        {
            "condition": "Service account not valid",
            "attribute_path" : ["config_template",0,"auth_config_template",0,"service_account",0,"service_account"],
            "values" : ["service@pde.com"],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details