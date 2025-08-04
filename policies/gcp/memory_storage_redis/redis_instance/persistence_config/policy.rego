package terraform.gcp.security.memorystorage_redis.redis_instance.persistence_config_policy

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
            "values": [[]],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.persistence_mode is RDB",
            "remedies": ["Set `persistence_config.persistence_mode = \"RDB\"`"]
        },
        {
            "condition": "Persistence mode must be RDB",
            "attribute_path": ["persistence_config", 0, "persistence_mode"],
            "values": ["RDB"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.rdb_snapshot_period is set to a valid option",
            "remedies": ["Set `persistence_config.rdb_snapshot_period` to valid option"]
        },
        {
            "condition": "Snapshot period must be valid",
            "attribute_path": ["persistence_config", 0, "rdb_snapshot_period"],
            "values": ["ONE_HOUR", "SIX_HOURS", "TWELVE_HOURS", "TWENTY_FOUR_HOURS"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details