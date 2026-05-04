package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.label_key

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_auto_labeling_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Auto Labeling Rule does not have a label key configured.",
            "remedies": ["Set label_key to a meaningful label key so conversations are classified correctly."]
        },
        {
            "condition": "Check if label key is not empty",
            "attribute_path": ["label_key"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details