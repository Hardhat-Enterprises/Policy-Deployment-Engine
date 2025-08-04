package terraform.gcp.security.memorystorage.redis.auth_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions :=[
    [
        {
            "situation_description": "Redis instances must have AUTH enabled to prevent unauthenticated access.",
            "remedies":[
                "Set `auth_enabled = true` in the redis_instance resource block."
            ]
        },
        {
            "condition": "Checks if auth_enable is set to TRUE",
            "attribute_path": ["auth_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details