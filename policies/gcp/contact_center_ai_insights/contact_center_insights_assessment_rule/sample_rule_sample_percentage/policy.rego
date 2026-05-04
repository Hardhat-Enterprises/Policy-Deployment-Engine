package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.sample_rule_sample_percentage

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Assessment Rule has invalid sample percentage.",
            "remedies": ["Set sample_percentage to an approved value such as 10, 25, or 50."]
        },
        {
            "condition": "Check if sample percentage uses an approved value",
            "attribute_path": ["sample_rule", 0, "sample_percentage"],
            "values": [10, 25, 50],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details