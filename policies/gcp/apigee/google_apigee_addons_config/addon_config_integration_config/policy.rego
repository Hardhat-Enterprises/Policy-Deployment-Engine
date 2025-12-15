package terraform.gcp.security.apigee.google_apigee_addons_config.addon_config_integration_config

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars

conditions := [
    [
        {
            "situation_description": "api_security_config and monetization_config must be enabled",
            "remedies": [
                "Enable the fields"
            ]
        },
        {
            "condition": "Ensures that the api_security_config and monetization_config are enabled",

            # Correct nested attribute path
            "attribute_path": ["addons_config",1,"api_security_config",0,"enabled"],

            # Allow only org names that match this pattern
            "values": [true],

            "policy_type": "whitelist"
        },
        {
            "condition": "Ensures that the api_security_config and monetization_config are enabled",

            # Correct nested attribute path
            "attribute_path": ["addons_config",4,"monetization_config",0,"enabled"],

            # Allow only org names that match this pattern
            "values": [true],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
