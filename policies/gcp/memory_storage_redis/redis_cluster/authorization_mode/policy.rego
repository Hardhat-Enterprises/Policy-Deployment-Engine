package terraform.gcp.security.memorystorage_redis.redis_cluster.authorization_mode_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions :=[
    [
        {
            "situation_description": "Redis clusters must have a valid authorization mode to prevent unauthenticated access.",
            "remedies":[
                "Set `authorization_mode = AUTH_MODE_IAM_AUTH` in the redis_cluster resource block."
            ]
        },
        {
            "condition": "Checks if authorization_mode is set to AUTH_MODE_IAM_AUTH",
            "attribute_path": ["authorization_mode"],
            "values": ["AUTH_MODE_IAM_AUTH"],
            "policy_type": "whitelist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details