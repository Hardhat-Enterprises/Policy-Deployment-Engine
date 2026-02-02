package terraform.gcp.security.app_engine.app_engine_service_split_traffic.allocations

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_service_split_traffic.vars

conditions := [
   [
        {
            "situation_description": "Version 'v1' is receiving an unapproved amount of traffic",
            "remedies": ["ensure 'v1' allocation is set to a standard split (e.g. 0.5 or 0.8)"]
        },
        {
            "condition": "Check v1 traffic allocation",
            "attribute_path": ["split", 0, "allocations", "v1"],
            "values": [0.01, 0.99], 
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details