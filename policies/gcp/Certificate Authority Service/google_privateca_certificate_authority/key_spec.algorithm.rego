package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.key_spec_algorithm

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority key algorithm must use an approved cryptographic standard to enforce encryption compliance.",
            "remedies": [
                "Set key_spec.algorithm to one of the approved values: 'EC_P384_SHA384', 'RSA_PSS_4096_SHA256', or 'RSA_PKCS1_4096_SHA256'.",
                "Avoid weaker algorithms such as 'RSA_PSS_2048_SHA256' or 'RSA_PKCS1_2048_SHA256'.",
                "When using a Cloud KMS key, ensure the underlying key version uses an approved algorithm."
            ]
        },
        {
            "condition": "key_spec algorithm is in approved encryption algorithm whitelist",
            "attribute_path": ["key_spec", 0, "algorithm"],
            "values": ["EC_P384_SHA384", "RSA_PSS_4096_SHA256", "RSA_PKCS1_4096_SHA256"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
