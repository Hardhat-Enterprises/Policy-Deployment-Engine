package terraform.gcp.security.container_attached.google_container_attached_cluster.binary_authorization_evaluation_mode

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "Binary Authorization evaluation mode is disabled or not set to enforcement. This allows unverified or insecure images to run on the cluster.",
            "remedies": [
                "Set binary_authorization.evaluation_mode to 'PROJECT_SINGLETON_POLICY_ENFORCE'.",
                "Ensure a Binary Authorization policy is configured in the Google Cloud project.",
                "Do not use 'DISABLED' in production environments."
            ]
        },
        {
            "condition": "Check if Binary Authorization evaluation_mode is set to ENFORCE",
            "attribute_path": ["binary_authorization", "evaluation_mode"],
            "values": ["PROJECT_SINGLETON_POLICY_ENFORCE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
