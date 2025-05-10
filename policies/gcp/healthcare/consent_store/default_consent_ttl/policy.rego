package terraform.gcp.security.healthcare.consent_store.default_consent_ttl

import data.terraform.gcp.helpers

scenarios_list := [
    # SCENARIO 1
    [
        {
            "situation_description": "Non-compliant default_consent_ttl setting.",
            "remedies": ["Use 86400s (24 hours) as default_consent_ttl."]
        },
        {
            "condition": "non-compliant default_consent_ttl",
            "attribute_path": ["default_consent_ttl"],
            "values": ["3600s"],  # explicitly blacklist this value
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_consent_store",
    "friendly_resource_name": "Google Cloud Healthcare Consent Store",
    "resource_value_name": "default_consent_ttl"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
