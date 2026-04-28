package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.annotator_selector

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule does not have sentiment annotator enabled.",
            "remedies": ["Enable run_sentiment_annotator to analyse customer sentiment."]
        },
        {
            "condition": "Check if sentiment annotator is enabled",
            "attribute_path": ["annotator_selector", 0, "run_sentiment_annotator"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule does not have summarization annotator enabled.",
            "remedies": ["Enable run_summarization_annotator to generate summaries."]
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