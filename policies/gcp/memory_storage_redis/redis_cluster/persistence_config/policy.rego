package terraform.gcp.security.memorystorage_redis.redis_cluster.persistence_config_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions := [
    [
        {
            "situation_description": "Persistence configuration must be present",
            "remedies": ["Add `persistence_config` block to redis_cluster resource"]
        },
        {
            "condition": "Persistence config existence check",
            "attribute_path": ["persistence_config"],
            "values": [null],
            "policy_type": "blacklist"
        },
        {
            "condition": "Mode must not be DISABLED",
            "attribute_path": ["persistence_config", 0, "mode"],
            "values": ["DISABLED"],
            "policy_type": "blacklist"
        },
    ],
    [
        {
            "situation_description": "AOF configuration validation for AOF mode resources",
            "remedies": [
                "Set `persistence_config.mode = \"AOF\"`",
                "Set `persistence_config.aof_config` block",
                "Set `append_fsync` to EVERYSEC, ALWAYS, or NO"
            ]
        },
        {
            "condition": "Mode must be AOF for AOF validation",
            "attribute_path": ["persistence_config", 0, "mode"],
            "values": ["AOF"],
            "policy_type": "blacklist"
        },
        {
            "condition": "AOF append_fsync must be valid",
            "attribute_path": ["persistence_config", 0, "aof_config", 0, "append_fsync"],
            "values": ["EVERYSEC", "ALWAYS", "NO"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "RDB configuration validation for RDB mode resources",
            "remedies": [
                "Set `persistence_config.mode = \"RDB\"`",
                "Set `persistence_config.rdb_config` block",
                "Set `rdb_snapshot_period` to ONE_HOUR, SIX_HOURS, TWELVE_HOURS, or TWENTY_FOUR_HOURS"
            ]
        },
        {
            "condition": "Mode must be RDB for RDB validation",
            "attribute_path": ["persistence_config", 0, "mode"],
            "values": ["RDB"],
            "policy_type": "blacklist"
        },
        {
            "condition": "RDB snapshot period must be valid",
            "attribute_path": ["persistence_config", 0, "rdb_config", 0, "rdb_snapshot_period"],
            "values": ["ONE_HOUR", "SIX_HOURS", "TWELVE_HOURS", "TWENTY_FOUR_HOURS"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
