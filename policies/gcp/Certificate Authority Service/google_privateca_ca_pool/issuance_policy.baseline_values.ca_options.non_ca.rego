package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_ca_options_non_ca

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline certificates must be explicitly marked as non-CA certificates.",
            "remedies": [
                "Set issuance_policy.baseline_values.ca_options.non_ca to true.",
                "Do not grant CA privileges to end-entity certificates."
            ]
        },
        {
            "condition": "baseline certificates must be explicitly non-CA",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "ca_options", 0, "non_ca"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details