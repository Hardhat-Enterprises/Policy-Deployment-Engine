package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.conditions_value

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Auto Labeling Rule has an empty condition value.",
            "remedies": ["Set conditions.value to an approved value so labels are applied with clear meaning."]
        },
        {
            "condition": "Check if condition value is not empty",
            "attribute_path": ["conditions", 0, "value"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details