package terraform.gcp.security.firebase_app_check.play_integrity_config.token_ttl_presence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.play_integrity_config.vars

conditions := [
    [
        {
            "situation_description": "Play Integrity token TTL is not explicitly set.",
            "remedies": ["Explicitly set the token_ttl to a desired value (e.g., '3600s')."]
        },
        {
            "condition": "The 'token_ttl' attribute is not set.",
            "attribute_path": ["token_ttl"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
