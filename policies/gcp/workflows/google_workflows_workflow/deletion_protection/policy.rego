package terraform.gcp.security.workflows.google_workflows_workflow.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Workflow does not have deletion protection or is set to false",
            "remedies": ["Workflow should have deletion protection set to true"]
        },
        {
            "condition": "deletion_protection set to true",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
