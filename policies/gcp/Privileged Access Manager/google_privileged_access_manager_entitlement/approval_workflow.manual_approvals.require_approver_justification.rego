package terraform.gcp.security.privileged_access_manager.entitlement.approval_workflow_manual_approvals_require_approver_justification

import data.terraform.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
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
