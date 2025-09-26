package terraform.gcp.security.firebase.google_firebase_app_check.debug_token

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_app_check.vars


conditions := [
    [
        {
            "situation_description": "Debug token display name is empty, which makes auditing and management harder.",
            "remedies": ["Provide a meaningful display_name for each debug token."]
        },
        {
            "condition": "Check if display_name is non-empty",
            "attribute_path": ["display_name"],
            "values": [""],   # placeholder for 'any non-empty string'
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
