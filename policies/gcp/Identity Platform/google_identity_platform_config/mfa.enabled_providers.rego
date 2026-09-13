package terraform.gcp.security.identity_platform.google_identity_platform_config.mfa_enabled_providers

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "No approved SMS multi-factor provider is configured.",
            "remedies": [
                "Add PHONE_SMS to mfa.enabled_providers when SMS-based MFA is part of the approved authentication posture."
            ]
        },
        {
            "condition": "MFA enabled providers must include PHONE_SMS",
            "attribute_path": ["mfa",0,"enabled_providers"],
            "values": ["PHONE_SMS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
