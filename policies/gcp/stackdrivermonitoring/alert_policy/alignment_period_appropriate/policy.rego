package terraform.gcp.security.stackdrivermonitoring.alert_policy.alignment_period_appropriate

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Alignment period is too long",
            "remedies": [
                "Set alignment_period ≤300s for accurate monitoring",
                "Ensure timely data aggregation"
            ]
        },
        {
            "condition": "Require appropriate alignment period (blacklist: >300s)",
            "attribute_path": ["conditions", 0, "condition_threshold", 0, "aggregations", 0, "alignment_period"],
            "values": ["600s", "1200s", "1800s"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details