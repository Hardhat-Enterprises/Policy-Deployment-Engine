package terraform.gcp.security.customer_engagement_suite.google_ces_agent.after_agent_callbacks_disabled

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars


conditions := [
    [
        {
            "situation_description" : "After-agent callbacks should remain enabled.",
            "remedies":[ 
                "Set disabled to false."
                ]
        },
        {
            "condition": "After-agent callbacks must be enabled.",
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



message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details