package terraform.gcp.security.container_attached.google_container_attached_cluster.allowed_oidc_issuer_urls

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [

    [
        {
            "situation_description": "The OIDC issuer URL is not restricted to approved identity providers, which can allow unauthorized authentication into the Kubernetes cluster.",
            "remedies": [
                "Set oidc_config.issuer_url to an approved identity provider only.",
                "Ensure issuer_url starts with https:// and belongs to a trusted organization.",
                "Maintain a whitelist of approved OIDC providers in Terraform variables."
            ]
        },
        {
            "condition": "Check if oidc_config.issuer_url is not in the approved list or does not start with https://",
            "attribute_path": ["oidc_config", "issuer_url"],
            "values": "https://oidc.issuer.url",
            "policy_type": "whitelist",
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details