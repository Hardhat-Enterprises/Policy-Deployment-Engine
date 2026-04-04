package terraform.gcp.security.cloud_composer.composer_environment.allowed_enabled_private_environment

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.composer_environment.vars

conditions := [

    [
        {
            "situation_description": "The environment is not private and may be exposed to the public internet.",
            "remedies": [
                "Set enable_private_environment = true in your Terraform configuration.",
                "Refer to Cloud Composer 3 documentation to enable private environments."
            ]
        },
        {
            "condition": "Check if enable_private_environment is not true",
            "attribute_path": ["config", "enable_private_environment"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details