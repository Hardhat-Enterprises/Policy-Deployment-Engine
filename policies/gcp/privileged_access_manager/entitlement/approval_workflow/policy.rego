package terraform.gcp.security.privileged_access_manager.entitlement.approval_workflow

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

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
    ],
        [
        {
            "situation_description": "Approver justification is not required",
            "remedies": ["Set require_approver_justification to true"]
        },
        {
            "condition": "Check if require_approver_justification is true",
            "attribute_path": ["approval_workflow", 0, "manual_approvals", 0, "require_approver_justification"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details