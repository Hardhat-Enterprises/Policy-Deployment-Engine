package terraform.gcp.security.stackdrivermonitoring.alert_policy.auto_close_reasonable

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Auto close duration is too long",
            "remedies": [
                "Set auto_close ≤604800s (7 days)",
                "Ensure proper alert lifecycle management"
            ]
        },
        {
            "condition": "Require reasonable auto close (blacklist: >604800s)",
            "attribute_path": ["alert_strategy", 0, "auto_close"],
            "values": ["1209600s", "2592000s"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details