package terraform.gcp.security.stackdrivermonitoring.alert_policy.filter_specific

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Filter is too broad or uses wildcards",
            "remedies": [
                "Use specific resource.type and metric.type",
                "Avoid wildcard filters"
            ]
        },
        {
            "condition": "Require specific filter (blacklist: wildcard)",
            "attribute_path": ["conditions", 0, "condition_threshold", 0, "filter"],
            "values": ["*", ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details