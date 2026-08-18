package terraform.gcp.security.container_attached.google_container_attached_cluster.proxy_config_kubernetes_secret_namespace

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "The cluster proxy configuration references a secret in an unapproved namespace. This could allow egress traffic to bypass security filters.",
            "remedies": [
                "Move the proxy secret to an approved namespace (e.g., 'kube-system').",
                "Update proxy_config.kubernetes_secret.namespace to match the approved list.",
                "Ensure the secret name follows corporate naming standards."
            ]
        },
        {
            "condition": "Verify proxy secret namespace is either kube-system or gatekeeper-system",
            "attribute_path": ["proxy_config", 0, "kubernetes_secret", 0, "namespace"],
            "values": "c",
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
