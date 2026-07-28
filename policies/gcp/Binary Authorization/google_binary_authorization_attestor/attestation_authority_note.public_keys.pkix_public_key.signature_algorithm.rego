package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.attestation_authority_note_public_keys_pkix_public_key_signature_algorithm

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
    [
        {
            "situation_description": "Attestor uses an insecure signature algorithm",
            "remedies": [
                "Use RSA_PSS with at least a 2048-bit key, or ECDSA_P256_SHA256"
            ]
        },
        {
            "condition": "Check if signature algorithm is not in the allowed whitelist",
            "attribute_path": ["attestation_authority_note", 0, "public_keys", 0, "pkix_public_key", 0, "signature_algorithm"],
            "values": ["RSA_PSS_2048_SHA256", "RSA_PSS_3072_SHA256", "RSA_PSS_4096_SHA256", "ECDSA_P256_SHA256"],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
