package terraform.gcp.security.container_attached.google_container_attached_cluster.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "The cluster deletion policy is set to ignore errors. This can lead to orphaned resources in Google Cloud and inconsistent infrastructure state.",
            "remedies": [
                "Set deletion_policy to 'DELETE'.",
                "Ensure that any dependencies (like RBAC or OIDC) are stable before attempting deletion.",
                "Avoid using 'DELETE_IGNORE_ERRORS' in production environments."
            ]
        },
        {
            "condition": "Check if deletion_policy is set to DELETE",
            "attribute_path": ["deletion_policy"],
            "values": ["DELETE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
