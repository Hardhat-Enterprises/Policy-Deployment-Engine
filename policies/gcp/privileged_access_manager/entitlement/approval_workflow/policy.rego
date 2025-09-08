package terraform.gcp.security.privileged_access_manager.entitlement.approval_workflow

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {
            "situation_description": "Entitlement does not have an approval workflow configured",
            "remedies": ["Add an approval_workflow block with appropriate approval steps"]
        },
        {
            "condition": "Check if approval_workflow array length is greater than 0",
            "attribute_path": ["approval_workflow"],
            "values": [0],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details