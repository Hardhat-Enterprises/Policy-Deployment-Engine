package terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.schedule_info_schedule

import data.terraform.helpers
import data.terraform.gcp.security.contact_center_ai_insights.contact_center_insights_assessment_rule.vars

conditions := [
    [
        {
            "situation_description": "Contact Center Insights Assessment Rule does not have a schedule configured.",
            "remedies": ["Set schedule_info.schedule to ensure periodic assessment execution."]
        },
        {
            "condition": "Check if schedule is not empty",
            "attribute_path": ["schedule_info", 0, "schedule"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details