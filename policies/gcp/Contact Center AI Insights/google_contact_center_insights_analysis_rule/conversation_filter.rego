package terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_analysis_rule.conversation_filter

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.google_contact_center_insights_analysis_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule is using an empty conversation filter.",
            "remedies": [
                "Set a specific conversation filter to limit analysis to approved conversation types.",
                "Avoid empty filters because they may analyse all conversations and increase risk."
            ]
        },
        {
            "condition": "Check if conversation filter is not empty",
            "attribute_path": ["conversation_filter"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
