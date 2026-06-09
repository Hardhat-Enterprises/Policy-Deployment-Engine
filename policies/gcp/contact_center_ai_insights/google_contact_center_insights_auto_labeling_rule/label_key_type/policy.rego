package terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_auto_labeling_rule.label_key_type

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_auto_labeling_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Auto Labeling Rule is using an unapproved label key type.",
            "remedies": ["Set label_key_type to LABEL_KEY_TYPE_CUSTOM for controlled custom classification."]
        },
        {
            "condition": "Check if label key type is approved",
            "attribute_path": ["label_key_type"],
            "values": ["LABEL_KEY_TYPE_CUSTOM"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
