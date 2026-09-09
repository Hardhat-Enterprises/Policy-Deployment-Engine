package terraform.gcp.security.api_hub.google_apihub_plugin.config_template_auth_config_template_supported_auth_types

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin.vars

conditions := [
    [
        {"situation_description" : "Check supported_auth_types match whitelist",
        "remedies":[ "Use valid supported auth types"]},
        {
            "condition": "Every supported auth type must be an allowed type",
            "attribute_path" : ["config_template",0,"auth_config_template",0,"supported_auth_types"],
            "values" : ["USER_PASSWORD"],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
