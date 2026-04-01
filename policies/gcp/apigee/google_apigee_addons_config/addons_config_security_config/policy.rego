package terraform.gcp.security.apigee.google_apigee_addons_config.addons_config_security_config

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "api_security_config should be enabled'",
            "remedies": [
                "Set enabled to true'"
            ]
        },
        {
            "condition": "Ensures that the api_security_config is enabled",
            "attribute_path": ["addons_config",0,"api_security_config",0,"enabled"],
            "values": true,

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
