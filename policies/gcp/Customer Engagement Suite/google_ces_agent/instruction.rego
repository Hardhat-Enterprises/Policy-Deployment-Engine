package terraform.gcp.security.customer_engagement_suite.google_ces_agent.instruction

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_agent.vars


conditions := [
    [
    {"situation_description" : "Agent instructions contain unsafe prompt patterns.",
    "remedies":[ "Remove unsafe instructions from the prompt.", "Follow secure prompt engineering practices."]},
    {
        "condition": "Instructions must not contain unsafe phrases.",
        "attribute_path" : [instruction], 
        "values" : [], # Values to compare against
        "policy_type" : "pattern blacklist" 
    }
    ]
]



message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details