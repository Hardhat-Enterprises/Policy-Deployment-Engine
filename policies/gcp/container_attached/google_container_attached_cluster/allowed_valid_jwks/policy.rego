package terraform.gcp.security.container_attached.google_container_attached_cluster.allowed_valid_jwks

import data.terraform.helpers
import data.terraform.gcp.security.container_attached.google_container_attached_cluster.vars

conditions := [
    [
        {
            "situation_description": "The OIDC JWKS is missing, empty, or not Base64 encoded. This prevents the cluster from securely validating identity tokens.",
            "remedies": [
                "Provide a valid JWKS (JSON Web Key Set) in the oidc_config block.",
                "Ensure the JWKS is Base64 encoded as required by the GCP API.",
                "Verify the JWKS follows RFC 7517 standards before encoding."
            ]
        },
        {
            "condition": "Check if oidc_config.jwks is missing, empty, or not valid Base64",
            "attribute_path": ["oidc_config", "jwks"],
            "values": "eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJub20iOiIifV19",
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details