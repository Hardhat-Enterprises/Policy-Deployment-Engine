package terraform.gcp.security.stackdrivermonitoring.alert_policy.alert_strategy_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Alert strategy is missing",
            "remedies": [
                "Configure alert_strategy block",
                "Set appropriate auto_close duration"
            ]
        },
        {
            "condition": "Require alert strategy (blacklist: missing alert_strategy)",
            "attribute_path": ["alert_strategy"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details