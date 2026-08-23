package terraform.gcp.security.compute_engine.google_compute_node_group.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_node_group.vars

conditions := [
    [
        {
            "situation_description": "The compute node group is configured without protection against destructive Terraform deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT for protected node groups.",
                "Require an explicit lifecycle review before permitting destructive removal.",
                "Use controlled decommissioning procedures for node groups that support critical workloads."
            ]
        },
        {
            "condition": "Require the node group to prevent destructive Terraform deletion.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details