package terraform.gcp.security.healthcare.consent_store.enable_consent_create_on_update

import data.terraform.gcp.helpers

scenarios_list := [
    # SCENARIO 1
    [
        {
            "situation_description": "Non-compliant enable_consent_create_on_update setting.",
            "remedies": ["Set enable_consent_create_on_update to true."]
        },
        {
            "condition": "non-compliant enable_consent_create_on_update",
            "attribute_path": ["enable_consent_create_on_update"],
            "values": ["false"],  # explicitly blacklist false
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_consent_store",
    "friendly_resource_name": "Google Cloud Healthcare Consent Store",
    "resource_value_name": "enable_consent_create_on_update"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
