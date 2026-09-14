package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_key_usage_unknown_extended_key_usages_object_id_path

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline certificates must not receive unapproved custom extended key usages.",
            "remedies": [
                "Remove unknown_extended_key_usages from issuance_policy.baseline_values.key_usage.",
                "Use explicitly approved standard extended key usage settings instead of custom OIDs."
            ]
        },
        {
            "condition": "no custom extended key usage entries are allowed",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "unknown_extended_key_usages"],
            "values": [null],
            "policy_type": "whitelist"
        },
        {
            "condition": "no custom extended key usage OID is allowed",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "key_usage", 0, "unknown_extended_key_usages", 0, "object_id_path"],
            "values": [null],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details