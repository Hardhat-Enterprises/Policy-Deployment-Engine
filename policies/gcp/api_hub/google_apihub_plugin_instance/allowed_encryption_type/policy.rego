package terraform.gcp.security.api_hub.google_apihub_plugin_instance.allowed_encryption_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin_instance.vars

conditions := [
    [
        {"situation_description" : "Auth_type does not match whitelist",
        "remedies":[ "Use valid auth types"]},
        {
            "condition": "Auth types not set to allowed types",
            "attribute_path" : ["auth_config",0,"auth_type"],
            "values" : ["USER_PASSWORD", "OAUTH2_CLIENT_CREDENTIALS"],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details