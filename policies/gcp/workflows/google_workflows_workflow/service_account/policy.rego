package terraform.gcp.security.workflows.google_workflows_workflow.service_account

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Service_account is using default service account is in use",
            "remedies": ["Configure and use a service account for the project"]
        },
        {
            "condition": "Prevents service_account from using the editor role default service account",
            "attribute_path": ["service_account"],
            "values": ["-*", [["compute@developer.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ],
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
