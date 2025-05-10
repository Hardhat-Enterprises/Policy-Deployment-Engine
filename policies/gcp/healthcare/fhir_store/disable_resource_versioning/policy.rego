package terraform.gcp.security.healthcare.fhir_store.disable_resource_versioning

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'disable_resource_versioning' setting.",
            "remedies": ["Set 'disable_resource_versioning' to false."]
        },
        {
            "condition": "non-compliant disable_resource_versioning",
            "attribute_path": ["disable_resource_versioning"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_fhir_store",
    "friendly_resource_name": "Google Cloud Healthcare FHIR Store",
    "resource_value_name": "disable_resource_versioning"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
