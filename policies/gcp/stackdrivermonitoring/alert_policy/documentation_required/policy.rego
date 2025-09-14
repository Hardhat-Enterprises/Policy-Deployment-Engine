package terraform.gcp.security.stackdrivermonitoring.alert_policy.documentation_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Documentation is missing",
            "remedies": [
                "Add documentation block with content",
                "Provide incident response procedures"
            ]
        },
        {
            "condition": "Require documentation (blacklist: missing documentation)",
            "attribute_path": ["documentation"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details