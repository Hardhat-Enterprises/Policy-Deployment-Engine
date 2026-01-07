package terraform.gcp.security.apigee.google_apigee_addons_config.addons_config_monetization_config

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "Monetization config should be enabled'",
            "remedies": [
                "Set enabled to true'"
            ]
        },
        {
            "condition": "Ensures that the Apigee Monetization config is enabled",

            # Correct nested attribute path
            "attribute_path": ["addons_config",[4],"monetization_config",[0],"enabled"],

            # Allow only org names that match this pattern
            "values": true,

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
