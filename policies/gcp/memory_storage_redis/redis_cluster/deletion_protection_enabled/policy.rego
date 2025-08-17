package terraform.gcp.security.memorystorage_redis.redis_cluster.deletion_protection_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions :=[
    [
        {
            "situation_description": "Deletion protection must be enabled to prevent accidental deletion of Redis clusters.",
            "remedies":[
                "Set `deletion_protection_enabled = true` in the redis_cluster resource block."
            ]
        },
        {
            "condition": "Checks if deletion_protection_enabled is set to true",
            "attribute_path": ["deletion_protection_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details