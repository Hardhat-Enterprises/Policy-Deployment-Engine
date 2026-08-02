package terraform.gcp.security.customer_engagement_suite.google_ces_agent.before_model_callbacks_disabled

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars

conditions := [
    [
        {
            "situation_description": "before-model callbacks should remain enabled.",
            "remedies": [
                "Set disabled to false."
            ]
        },
        {
            "condition": "before-model callbacks must be enabled.",
            "attribute_path": [
                "before_model_callbacks",
                "disabled"
            ],
            "values": [
                false
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details