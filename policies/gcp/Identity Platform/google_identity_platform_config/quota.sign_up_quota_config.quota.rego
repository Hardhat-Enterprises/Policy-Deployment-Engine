package terraform.gcp.security.identity_platform.google_identity_platform_config.quota_sign_up_quota_config_quota

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "The temporary sign-up quota permits an excessive account-creation rate.",
            "remedies": [
                "Set quota.sign_up_quota_config.quota between 1 and 100 sign-ups per project, hour, and IP."
            ]
        },
        {
            "condition": "Temporary sign-up quota must be between 1 and 100",
            "attribute_path": ["quota",0,"sign_up_quota_config",0,"quota"],
            "values": [1, 100],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
