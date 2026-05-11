package terraform.gcp.security.container_attached.google_container_attached_cluster.approved_distributions

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "The cluster distribution type is unapproved or set to 'generic'. This can lead to compatibility issues or a lack of cloud-specific security optimizations.",
            "remedies": [
                "Set the distribution attribute to either 'eks' or 'aks'.",
                "Do not use 'generic' for production workloads unless specifically authorized.",
                "Ensure the distribution matches the actual underlying cloud provider where the cluster resides."
            ]
        },
        {
            "condition": "Check if distribution is in the approved list (eks, aks)",
            "attribute_path": ["distribution"],
            "values": ["eks", "aks"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details