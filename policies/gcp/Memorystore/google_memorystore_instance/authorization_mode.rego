package terraform.gcp.security.memorystore.google_memorystore_instance.authorization_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore.google_memorystore_instance.vars

conditions := [
    [
        {
            "situation_description": "Redis instances must use IAM-based authentication (AUTH_MODE_IAM_AUTH) to enforce centralized access control.",
            "remedies": [
                "Set `authorization_mode = 'AUTH_MODE_IAM_AUTH'` in the google_redis_instance resource block."
            ]
        },
        {
            "condition": "Checks if authorization_mode is AUTH_MODE_IAM_AUTH",
            "attribute_path": ["authorization_mode"],
            "values": ["AUTH_MODE_IAM_AUTH"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details