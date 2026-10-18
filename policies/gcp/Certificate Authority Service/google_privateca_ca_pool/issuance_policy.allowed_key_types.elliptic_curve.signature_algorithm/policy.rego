package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_allowed_key_types_elliptic_curve_signature_algorithm

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool issuance policy must restrict elliptic curve signing algorithms to OS-approved types only.",
            "remedies": [
                "Set issuance_policy.allowed_key_types.elliptic_curve.signature_algorithm to 'ECDSA_P384' or 'ECDSA_P256'.",
                "Avoid 'EDDSA_25519' unless explicitly approved by the security team.",
                "Remove any unspecified or legacy key type entries."
            ]
        },
        {
            "condition": "elliptic_curve signature_algorithm is in approved algorithm whitelist",
            "attribute_path": ["issuance_policy", 0, "allowed_key_types", 0, "elliptic_curve", 0, "signature_algorithm"],
            "values": ["ECDSA_P256", "ECDSA_P384"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
