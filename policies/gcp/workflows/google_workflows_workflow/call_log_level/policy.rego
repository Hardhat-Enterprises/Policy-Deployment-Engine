package terraform.gcp.security.workflows.google_workflows_workflow.call_log_level

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Call_log_level is set to a highly priviledged level that may leak sensitive information",
            "remedies": ["Call_log_level should be set to LOG_ERRORS_ONLY"]
        },
        {
            "condition": "Checks that only Call_log_level is set to LOG_ERRORS_ONLY",
            "attribute_path": ["call_log_level"],
            "values": ["LOG_ERRORS_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
