package terraform.gcp.security.memorystore.instance.authorization_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystore.redis.vars

conditions := [
    [
        {
            "situation_description": "Redis instances must use IAM-based authentication (AUTH_MODE_IAM_AUTH) to enforce centralized access control.",
            "remedies": [
                "Set `authorization_mode = 'AUTH_MODE_IAM_AUTH'` in the google_redis_instance resource block."
            ]
        },
        {
            "condition": "Checks if authorization_mode is AUTH_MODE_IAM_AUTH when present",
            "attribute_path": ["authorization_mode"],
            "values": ["AUTH_MODE_IAM_AUTH"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details