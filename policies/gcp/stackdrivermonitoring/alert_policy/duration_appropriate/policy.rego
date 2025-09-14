package terraform.gcp.security.stackdrivermonitoring.alert_policy.duration_appropriate

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Detection duration is too long",
            "remedies": [
                "Set duration ≤600s for timely detection",
                "Ensure rapid incident response"
            ]
        },
        {
            "condition": "Require appropriate duration (blacklist: >600s)",
            "attribute_path": ["conditions", 0, "condition_threshold", 0, "duration"],
            "values": ["1800s", "3600s", "7200s"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details