package terraform.gcp.security.healthcare.fhir_store.disable_referential_integrity

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'disable_referential_integrity' setting.",
            "remedies": ["Set 'disable_referential_integrity' to false."]
        },
        {
            "condition": "non-compliant disable_referential_integrity",
            "attribute_path": ["disable_referential_integrity"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_fhir_store",
    "friendly_resource_name": "Google Cloud Healthcare FHIR Store",
    "resource_value_name": "disable_referential_integrity"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
