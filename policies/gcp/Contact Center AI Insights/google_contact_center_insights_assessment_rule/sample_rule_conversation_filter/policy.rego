package terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_assessment_rule.sample_rule_conversation_filter

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_assessment_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Assessment Rule is using an empty sample rule conversation filter.",
            "remedies": ["Set a specific sample rule conversation filter to limit assessment to approved conversation types."]
        },
        {
            "condition": "Check if sample rule conversation filter is not empty",
            "attribute_path": ["sample_rule", 0, "conversation_filter"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
