package terraform.gcp.security.app_engine.app_engine_flexible_app_version.automatic_scaling.cpu_utilization.target_utilization

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine CPU target utilization is not within the approved range",
            "remedies": ["Set 'automatic_scaling.cpu_utilization.target_utilization' to a value between 0.5 and 0.8"]
        },
        {
            "condition": "Check CPU target utilization is within the approved range",
            "attribute_path": ["automatic_scaling", 0, "cpu_utilization", 0, "target_utilization"],
            "values": [0.5, 0.8],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details