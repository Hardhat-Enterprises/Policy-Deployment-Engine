package terraform.gcp.security.identity_platform.google_identity_platform_config.sign_in_allow_duplicate_emails

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Multiple user accounts can share the same email address.",
            "remedies": [
                "Set sign_in.allow_duplicate_emails to false to preserve a unique email identity mapping."
            ]
        },
        {
            "condition": "Duplicate email accounts must be disabled",
            "attribute_path": ["sign_in",0,"allow_duplicate_emails"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
