package terraform.gcp.security.cloud_composer.composer_environment.allowed_enabled_private_builds_only

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.composer_environment.vars

conditions := [

    [
        {
            "situation_description": "Builds performed have internet access which can expose sensitive dependencies.",
            "remedies": [
                "Set enable_private_builds_only = true in your Terraform configuration.",
                "Refer to Cloud Composer 3 documentation to enforce private builds."
            ]
        },
        {
            "condition": "Check if enable_private_builds_only is not true",
            "attribute_path": ["config", "enable_private_builds_only"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details