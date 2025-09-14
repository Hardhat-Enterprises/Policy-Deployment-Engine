package terraform.gcp.security.stackdrivermonitoring.alert_policy.combiner_or_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Combiner should be OR for security alerts",
            "remedies": [
                "Set combiner = \"OR\" for comprehensive monitoring",
                "Avoid missing alerts with AND logic"
            ]
        },
        {
            "condition": "Require OR combiner (blacklist: AND)",
            "attribute_path": ["combiner"],
            "values": ["AND"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details