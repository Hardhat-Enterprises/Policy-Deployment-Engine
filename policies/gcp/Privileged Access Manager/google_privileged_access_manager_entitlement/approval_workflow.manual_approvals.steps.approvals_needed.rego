package terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.approval_workflow_manual_approvals_steps_approvals_needed

import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.google_privileged_access_manager_entitlement.vars

conditions := [
    [
        {
            "situation_description": "Approvals needed is outside the acceptable range (1-3)",
            "remedies": ["Set approvals_needed to a value between 1 and 3 inclusive"]
        },
        {
            "condition": "Check if approvals_needed is within range 1-3",
            "attribute_path": ["approval_workflow", 0, "manual_approvals", 0, "steps", 0, "approvals_needed"],
            "values": [1, 3],
            "policy_type": "range"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
