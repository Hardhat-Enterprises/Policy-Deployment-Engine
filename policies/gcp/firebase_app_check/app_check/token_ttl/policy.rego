package terraform.gcp.security.firebase.app_check.app_attest.token_ttl

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.app_check.app_attest.vars

# Scenario: token_ttl must be between 30 minutes (1800s) and 7 days (604800s)
conditions := [
    [
        {
            "situation_description": "Firebase App Check App Attest token_ttl must be between 30 minutes and 7 days.",
            "remedies": [
                "Set token_ttl within the allowed range (1800s - 604800s)."
            ]
        },
        {
            "condition": "Check token_ttl range",
            "attribute_path": ["token_ttl"],
            "values": [1800, 604800],
            "policy_type": "range"
        }
    ]
]

# General compliance summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance report per resource
details := helpers.get_multi_summary(conditions, vars.variables).details
