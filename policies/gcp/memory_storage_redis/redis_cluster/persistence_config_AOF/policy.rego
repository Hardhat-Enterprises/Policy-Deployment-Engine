package terraform.gcp.security.memorystorage_redis.redis_cluster.persistence_config_AOF

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions := [
    [
        {
            "situation_description": "Checks if persistence configurations are present",
            "remedies": ["Add `persistence_config` block to redis_instance resource"]
        },
        {
            "condition": "Persistence config must be present",
            "attribute_path": ["persistence_config"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.persistence_mode is AOF",
            "remedies": ["Set `persistence_config.mode = \"AOF\"`"]
        },
        {
            "condition": "Persistence mode must be AOF",
            "attribute_path": ["persistence_config", 0, "mode"],
            "values": ["AOF"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.aof_config is setted explicitly",
            "remedies": ["persistence_config.aof_config must be setted explicitly"]
        },
        {
            "condition": "Validates if aof_config is set",
            "attribute_path": ["persistence_config", 0, "aof_config"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.aof_config.append_fsync is setted explicitly",
            "remedies": ["persistence_config.aof_config.append_fsync must be setted as `EVERYSEC`, `ALWAYS`, or `NO`"]
        },
        {
            "condition": "Validates if append_fsync is set",
            "attribute_path": ["persistence_config", 0, "aof_config", 0, "append_fsync"],
            "values": ["EVERYSEC", "ALWAYS", "NO"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details