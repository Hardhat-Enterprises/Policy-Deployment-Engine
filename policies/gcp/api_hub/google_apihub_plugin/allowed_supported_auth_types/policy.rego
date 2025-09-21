package terraform.gcp.security.api_hub.google_apihub_plugin.allowed_supported_auth_types

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin.vars

conditions := [
    [
        {"situation_description" : "Check supported_auth_types match whitelist",
        "remedies":[ "Use valid supported auth types"]},
        {
            "condition": "Auth types not set to allowed types",
            "attribute_path" : ["config_template",0,"auth_config_template",0,"supported_auth_types",0],
            "values" : ["USER_PASSWORD"],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details