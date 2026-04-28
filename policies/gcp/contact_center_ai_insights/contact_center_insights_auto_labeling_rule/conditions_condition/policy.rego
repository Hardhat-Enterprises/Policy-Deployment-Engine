package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.conditions_condition

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Auto Labeling Rule has an empty condition expression.",
            "remedies": ["Set conditions.condition to a specific expression so labels are applied only to intended conversations."]
        },
        {
            "condition": "Check if condition expression is not empty",
            "attribute_path": ["conditions", 0, "condition"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details