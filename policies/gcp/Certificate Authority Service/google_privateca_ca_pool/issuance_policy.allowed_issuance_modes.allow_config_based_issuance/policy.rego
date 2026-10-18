package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_allowed_issuance_modes_allow_config_based_issuance

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pools must not allow unapproved config-based certificate issuance.",
            "remedies": [
                "Set issuance_policy.allowed_issuance_modes.allow_config_based_issuance to false.",
                "Use the approved CSR-based issuance workflow instead."
            ]
        },
        {
            "condition": "config-based issuance must be disabled",
            "attribute_path": ["issuance_policy", 0, "allowed_issuance_modes", 0, "allow_config_based_issuance"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details