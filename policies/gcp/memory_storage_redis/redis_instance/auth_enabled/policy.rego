package terraform.gcp.security.memorystorage_redis.redis_instance.auth_enabled_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.google_redis_instance_vars

# opa eval --input inputs/gcp/memory_storage_redis/redis_instance/auth_enabled/plan.json --data policies "data.terraform.gcp.security.memorystorage_redis.redis_instance.auth_enabled_policy.message"
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