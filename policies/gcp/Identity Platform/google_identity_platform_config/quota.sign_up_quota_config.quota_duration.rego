package terraform.gcp.security.identity_platform.google_identity_platform_config.quota_sign_up_quota_config_quota_duration

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "The temporary sign-up quota override remains active beyond the approved one-hour window.",
            "remedies": [
                "Set quota.sign_up_quota_config.quota_duration to 3600s."
            ]
        },
        {
            "condition": "Temporary sign-up quota duration must be one hour",
            "attribute_path": ["quota",0,"sign_up_quota_config",0,"quota_duration"],
            "values": ["3600s"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
