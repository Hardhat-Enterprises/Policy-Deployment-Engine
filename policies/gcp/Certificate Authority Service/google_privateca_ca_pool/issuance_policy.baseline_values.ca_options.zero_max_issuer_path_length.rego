package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_ca_options_zero_max_issuer_path_length

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline values must explicitly prevent subordinate CA delegation.",
            "remedies": [
                "Set issuance_policy.baseline_values.ca_options.zero_max_issuer_path_length to true.",
                "Keep is_ca false for this leaf-certificate pool; a zero path-length constraint adds protection if CA issuance is later permitted."
            ]
        },
        {
            "condition": "issuer path length must be explicitly zero",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "ca_options", 0, "zero_max_issuer_path_length"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details