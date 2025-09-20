package terraform.gcp.security.stackdrivermonitoring.alert_policy.threshold_value_reasonable

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Threshold value is unreasonably high",
            "remedies": [
                "Set threshold_value ≤100 for effective monitoring",
                "Avoid alert fatigue with reasonable thresholds"
            ]
        },
        {
            "condition": "Require reasonable threshold (range: ≤100)",
            "attribute_path": ["conditions", 0, "condition_threshold", 0, "threshold_value"],
            "range": {"max": 100},
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details