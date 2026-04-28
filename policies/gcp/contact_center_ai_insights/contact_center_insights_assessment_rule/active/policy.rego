package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.active

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Assessment Rule is not active.",
            "remedies": ["Set active to true so assessment rules can run."]
        },
        {
            "condition": "Check if assessment rule is active",
            "attribute_path": ["active"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details