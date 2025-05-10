package terraform.gcp.security.healthcare.fhir_store.default_search_handling_strict

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'default_search_handling_strict' setting.",
            "remedies": ["Set 'default_search_handling_strict' to true."]
        },
        {
            "condition": "non-compliant default_search_handling_strict",
            "attribute_path": ["default_search_handling_strict"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_fhir_store",
    "friendly_resource_name": "Google Cloud Healthcare FHIR Store",
    "resource_value_name": "default_search_handling_strict"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
