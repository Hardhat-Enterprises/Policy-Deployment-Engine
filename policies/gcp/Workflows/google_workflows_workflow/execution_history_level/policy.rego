package terraform.gcp.security.workflows.google_workflows_workflow.execution_history_level

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "execution_history_level is set to a highly priviledged level that may leak sensitive information",
            "remedies": ["Execution_history_level should be set to EXECUTION_HISTORY_BASIC"]
        },
        {
            "condition": "Checks that only Execution_history_level is set to EXECUTION_HISTORY_BASIC",
            "attribute_path": ["execution_history_level"],
            "values": ["EXECUTION_HISTORY_BASIC"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


