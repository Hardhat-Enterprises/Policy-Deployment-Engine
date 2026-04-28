package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.run_summarization_annotator

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule does not have summarization annotator enabled.",
            "remedies": ["Enable run_summarization_annotator to generate conversation summaries."]
        },
        {
            "condition": "Check if summarization annotator is enabled",
            "attribute_path": ["annotator_selector", 0, "run_summarization_annotator"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details