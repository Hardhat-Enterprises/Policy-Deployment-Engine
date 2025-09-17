package terraform.gcp.security.memorystore.instance.persistence_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystore.redis.vars

conditions := [
    [
        {
            "situation_description": "Redis instances must use RDB persistence mode to ensure point-in-time recovery capability.",
            "remedies": [
                "Set `persistence_config.persistence_mode = 'RDB'` in the google_redis_instance resource block."
            ]
        },
        {
            "condition": "Checks if persistence_config.persistence_mode is RDB",
            "attribute_path": ["persistence_config", "persistence_mode"],
            "values": ["RDB"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details