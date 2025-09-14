package terraform.gcp.security.firebase.firebase_project_rate_limit.rate_limit

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.firebase.firebase_project_rate_limit.google_project_service.vars

conditions := [
    [
        {
            "situation_description": "Firebase project does not have login rate limiting enabled.",
            "remedies": [
                "Enable rate limiting on Firebase authentication.",
                "Set max attempts per user/IP within a safe threshold."
            ]
        },
        {
            "condition": "Rate limiting must be enabled with a maximum threshold",
            "attribute_path": ["rate_limit"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
