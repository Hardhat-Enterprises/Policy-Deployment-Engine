package terraform.gcp.security.healthcare.fhir_store.enable_history_import

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'enable_history_import' setting.",
            "remedies": ["Set 'enable_history_import' to false to prevent importing historical versions of resources."]
        },
        {
            "condition": "non-compliant enable_history_import",
            "attribute_path": ["enable_history_import"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_fhir_store",
    "friendly_resource_name": "Google Cloud Healthcare FHIR Store",
    "resource_value_name": "enable_history_import"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
