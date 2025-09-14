package terraform.gcp.security.stackdrivermonitoring.alert_policy.enabled_required

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Alert policy is disabled",
            "remedies": [
                "Set enabled = true for monitoring alert policies",
                "Ensure security monitoring is active"
            ]
        },
        {
            "condition": "Require enabled=true (blacklist: enabled=false)",
            "attribute_path": ["enabled"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details