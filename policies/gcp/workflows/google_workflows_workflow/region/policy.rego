package terraform.gcp.security.workflows.google_workflows_workflow.region

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Workflow is set from outside of australia",
            "remedies": ["Workflow should be configured to a region in Australia"]
        },
        {
            "condition": "Region is set to an Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
