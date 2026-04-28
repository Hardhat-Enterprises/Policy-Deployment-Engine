package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.location
import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_analysis_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Analysis Rule is deployed in an unapproved location.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2."
            ]
        },
        {
            "condition": "Check if location is within approved regions",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details