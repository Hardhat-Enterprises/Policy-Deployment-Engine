package terraform.gcp.security.identity_platform.google_identity_platform_config.mfa_state

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Multi-factor authentication is not mandatory for the project.",
            "remedies": [
                "Set mfa.state to MANDATORY so every supported user must complete a second factor."
            ]
        },
        {
            "condition": "Project MFA state must be MANDATORY",
            "attribute_path": ["mfa",0,"state"],
            "values": ["MANDATORY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

