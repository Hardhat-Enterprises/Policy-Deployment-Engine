package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_key_usage_base_key_usage_cert_sign

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "Certificates issued by the CA Pool must not be given certificate-signing capability by default.",
            "remedies": [
                "Set issuance_policy.baseline_values.key_usage.base_key_usage.cert_sign to false.",
                "Allow certificate signing only through an explicitly approved CA issuance process."
            ]
        },
        {
            "condition": "issued certificates must not have certificate-signing key usage",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "base_key_usage", 0, "cert_sign"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details