package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.qa_config

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule does not have QA scoring enabled.",
            "remedies": ["Configure QA scorecard revisions so conversations can be assessed against required review standards."]
        },
        {
            "condition": "Check if QA scoring is enabled",
            "attribute_path": ["annotator_selector", 0, "qa_config", 0, "scorecard_list", 0, "qa_scorecard_revisions"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details