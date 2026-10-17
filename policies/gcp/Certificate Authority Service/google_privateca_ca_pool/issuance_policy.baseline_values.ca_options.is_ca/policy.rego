package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_ca_options_is_ca

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool issuance policy must not give issued certificates certificate-authority privileges.",
            "remedies": [
                "Set issuance_policy.baseline_values.ca_options.is_ca to false.",
                "Only explicitly approved CA certificates should be able to sign subordinate certificates."
            ]
        },
        {
            "condition": "issued certificates must not be CAs",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "ca_options", 0, "is_ca"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details