package terraform.gcp.security.customer_engagement_suite.google_ces_agent.after_agent_callbacks_disabled

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars


conditions := [
    [
        {
            "situation_description" : "after-agent callbacks should remain enabled.",
            "remedies":[ 
                "Set disabled to false."
                ]
        },
        {
            "condition": "after-agent callbacks must be enabled.",
            "attribute_path" : [
                "after_agent_callbacks", 
                "disabled"
                ],
            "values" : [
                false
                ],
            "policy_type" : "whitelist"
        }
    ]
]



result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details