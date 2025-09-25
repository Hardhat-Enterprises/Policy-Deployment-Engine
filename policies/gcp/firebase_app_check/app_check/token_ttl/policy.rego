package terraform.gcp.security.firebase_app_check.app_check.token_ttl

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.app_check.vars

# Scenario: token_ttl must be at least 30 minutes (1800s)
conditions := [
    [
        {
            "situation_description": "Firebase App Check token_ttl must be at least 30 minutes (1800s).",
            "remedies": [
                "Set token_ttl to a compliant value, for example '1800s'."
            ]
        },
        {
            "condition": "Check for compliant token_ttl",
            "attribute_path": ["token_ttl"],
            "values": ["1800s"],
            "policy_type": "whitelist"
        }
    ]
]

# General compliance summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report per resource
details := helpers.get_multi_summary(conditions, vars.variables).details
