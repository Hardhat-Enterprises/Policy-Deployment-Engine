package terraform.gcp.security.container_attached.google_container_attached_cluster.allowed_platform_version

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "The cluster is using an outdated or unsupported platform version. This increases the risk of security vulnerabilities and integration failures.",
            "remedies": [
                "Upgrade the platform_version to at least 1.29.0-gke.0 or higher.",
                "Check 'gcloud container attached get-server-config' for the latest valid versions.",
                "Ensure the underlying cluster (EKS/AKS) is also running a compatible Kubernetes version."
            ]
        },
        {
            "condition": "Check if platform_version is greater than or equal to 1.28.0",
            "attribute_path": ["platform_version"],
            "values": "1.29.1-gke.1",
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details