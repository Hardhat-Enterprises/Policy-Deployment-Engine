package terraform.gcp.security.memorystorage_redis.redis_cluster.persistence_config_RDB

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
            "situation_description": "Checks if persistence_config.persistence_mode is RDB",
            "remedies": ["Set `persistence_config.mode = \"RDB\"`"]
        },
        {
            "condition": "Persistence mode must be RDB",
            "attribute_path": ["persistence_config", 0, "mode"],
            "values": ["RDB"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.rdb_config is setted explicitly",
            "remedies": ["persistence_config.rdb_config must be setted explicitly"]
        },
        {
            "condition": "Validates if rdb_config is set",
            "attribute_path": ["persistence_config", 0, "rdb_config"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Checks if persistence_config.rdb_config.rdb_snapshot_period is setted explicitly",
            "remedies": ["persistence_config.rdb_config.rdb_snapshot_period must be setted as `ONE_HOUR`, `SIX_HOURS`, `TWELVE_HOURS`, or `TWENTY_FOUR_HOURS`"]
        },
        {
            "condition": "Validates if rdb_snapshot_period is set",
            "attribute_path": ["persistence_config", 0, "rdb_config", 0, "rdb_snapshot_period"],
            "values": ["ONE_HOUR", "SIX_HOURS", "TWELVE_HOURS", "TWENTY_FOUR_HOURS"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details