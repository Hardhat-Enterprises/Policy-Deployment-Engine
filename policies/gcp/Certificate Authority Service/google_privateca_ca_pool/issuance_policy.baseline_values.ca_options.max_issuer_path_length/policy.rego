package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_ca_options_max_issuer_path_length

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline values must not explicitly permit subordinate CA delegation.",
            "remedies": [
                "Remove a positive issuance_policy.baseline_values.ca_options.max_issuer_path_length.",
                "This pool uses a leaf-certificate baseline; keep issuance_policy.baseline_values.ca_options.is_ca false."
            ]
        },
        {
            "condition": "explicit issuer path length must be zero",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "ca_options", 0, "max_issuer_path_length"],
            "values": [0, 0],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details