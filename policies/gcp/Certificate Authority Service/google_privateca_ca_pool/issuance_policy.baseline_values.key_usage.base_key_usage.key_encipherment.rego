package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_key_usage_base_key_usage_key_encipherment

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool certificate profiles must not grant unnecessary key encipherment capability.",
            "remedies": [
                "Set issuance_policy.baseline_values.key_usage.base_key_usage.key_encipherment to false.",
                "Disabling unnecessary key encipherment keeps certificate key usage limited to its intended purpose."
            ]
        },
        {
            "condition": "key_encipherment must not be enabled",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "base_key_usage", 0, "key_encipherment"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details