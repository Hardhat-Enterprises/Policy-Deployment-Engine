package terraform.gcp.security.memorystorage_redis.redis_cluster.persistence_config_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.memorystorage.redis.vars

conditions_1 := [
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
            "values": ["AOF", "RDB"],
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

conditions_2 := [
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
            "values": ["RDB", "AOF"],
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


all_resources := helpers.get_all_resources(vars.variables.resource_type)

has_aof := count([resource |
    resource := all_resources[_]
    resource.values.persistence_config != null
    resource.values.persistence_config[0].mode == "AOF"
]) > 0

has_rdb := count([resource |
    resource := all_resources[_]
    resource.values.persistence_config != null
    resource.values.persistence_config[0].mode == "RDB"
]) > 0


final_conditions := conditions_1 if {
    has_aof
} else := conditions_2 if {
    has_rdb
} else := [
    [
        {
            "situation_description": "No valid persistence mode detected",
            "remedies": ["Set persistence_config.mode to either 'AOF' or 'RDB'"]
        },
        {
            "condition": "Persistence config must be present",
            "attribute_path": ["values", "persistence_config"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]


message := helpers.get_multi_summary(final_conditions, vars.variables).message
details := helpers.get_multi_summary(final_conditions, vars.variables).details