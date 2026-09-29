package terraform.gcp.security.customer_engagement_suite.google_ces_agent.before_tool_callbacks_disabled

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "before-tool callbacks should remain enabled.",
            "remedies": [
                "Set disabled to false."
            ]
        },
        {
            "condition": "before-tool callbacks must be enabled.",
            "attribute_path": [
                "before_tool_callbacks",
                "disabled"
            ],
            "values": [
                false
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details