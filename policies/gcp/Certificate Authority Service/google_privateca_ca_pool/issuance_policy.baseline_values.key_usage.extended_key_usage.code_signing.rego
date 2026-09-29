package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_key_usage_extended_key_usage_code_signing

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline certificates must not be granted code-signing capability by default.",
            "remedies": [
                "Set issuance_policy.baseline_values.key_usage.extended_key_usage.code_signing to false.",
                "Use a separately approved certificate profile when code signing is required."
            ]
        },
        {
            "condition": "baseline certificates must not allow code signing",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "extended_key_usage", 0, "code_signing"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details