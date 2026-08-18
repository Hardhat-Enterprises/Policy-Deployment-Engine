package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_allowed_issuance_modes_allow_csr_based_issuance

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool issuance policy must allow CSR-based certificate issuance to support standard certificate request workflows.",
            "remedies": [
                "Set issuance_policy.allowed_issuance_modes.allow_csr_based_issuance to true.",
                "CSR-based issuance is the standard method for certificate requests and must be enabled."
            ]
        },
        {
            "condition": "allow_csr_based_issuance is in approved whitelist",
            "attribute_path": ["issuance_policy", 0, "allowed_issuance_modes", 0, "allow_csr_based_issuance"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
