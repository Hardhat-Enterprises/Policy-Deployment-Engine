package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.allowed_key_algorithm

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.vars as vars

conditions := [
    [
        {
            "situation_description": "When a certificate issuance config uses a non-approved key algorithm, the generated private key may not align with the organisation's certificate security standard.",
            "remedies": [
                "Use an approved key algorithm for certificate issuance configuration."
            ]
        },
        {
            "condition": "Certificate issuance configs should use the approved key algorithm.",
            "attribute_path": ["key_algorithm"],
            "values": ["ECDSA_P256"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details