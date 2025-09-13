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
            "condition": "Check if approval_workflow is configured",
            "attribute_path": ["approval_workflow"],
            "values": [null, {}],
            "policy_type": "blacklist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details