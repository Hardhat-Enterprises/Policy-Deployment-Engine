package terraform.gcp.security.app_engine.app_engine_service_split_traffic.shard_by

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_service_split_traffic.vars

conditions := [
   [
        {
            "situation_description": "Traffic sharding mechanism is unstable/unspecified",
            "remedies": ["Need to set split.shard_by to 'IP' or 'COOKIE' to ensure stable session routing"]
        },
        {
            "condition": "Whitelist stable sharding mechanisms",
            "attribute_path": ["split", 0, "shard_by"],
            "values": ["IP", "COOKIE"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details