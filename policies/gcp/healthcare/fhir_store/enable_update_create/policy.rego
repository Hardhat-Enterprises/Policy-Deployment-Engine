package terraform.gcp.security.healthcare.fhir_store.enable_update_create

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'enable_update_create' setting.",
            "remedies": ["Set 'enable_update_create' to false to avoid allowing resource creation via update operations."]
        },
        {
            "condition": "non-compliant enable_update_create",
            "attribute_path": ["enable_update_create"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_fhir_store",
    "friendly_resource_name": "Google Cloud Healthcare FHIR Store",
    "resource_value_name": "enable_update_create"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
