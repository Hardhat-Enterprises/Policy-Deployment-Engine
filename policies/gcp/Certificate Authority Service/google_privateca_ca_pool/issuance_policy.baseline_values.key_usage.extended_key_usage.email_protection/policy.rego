package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_key_usage_extended_key_usage_email_protection

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline certificates must not be granted email-protection capability by default.",
            "remedies": [
                "Set issuance_policy.baseline_values.key_usage.extended_key_usage.email_protection to false.",
                "Use a separately approved certificate profile when email protection is required."
            ]
        },
        {
            "condition": "baseline certificates must not allow email protection",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "extended_key_usage", 0, "email_protection"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details