package terraform.gcp.security.apigee.google_apigee_addons_config.addons_config_advanced_api_ops_config

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "advanced_api_ops_config should be enabled'",
            "remedies": [
                "Set enabled to true'"
            ]
        },
        {
            "condition": "Ensures that the advanced_api_ops_config is enabled",
            "attribute_path": ["addons_config",0,"advanced_api_ops_config",0,"enabled"],
            "values": true,

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
