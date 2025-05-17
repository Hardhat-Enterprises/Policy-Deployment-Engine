package terraform.gcp.security.healthcare.consent_store.default_consent_ttl
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.consent_store.vars

conditions := [
    # SCENARIO 1
    [
        {
            "situation_description": "Non-compliant default_consent_ttl setting.",
            "remedies": ["Use 86400s (24 hours) as default_consent_ttl."]
        },
        {
            "condition": "non-compliant default_consent_ttl",
            "attribute_path": ["default_consent_ttl"],
            "values": ["3600s"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details