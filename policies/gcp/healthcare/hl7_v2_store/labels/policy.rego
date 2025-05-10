package terraform.gcp.security.healthcare.hl7_v2_store.labels

import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Sensitive or non-approved label keys found in HL7v2 store.",
            "remedies": [
                "Use only approved label keys such as 'environment' and 'service'.",
                "Avoid including sensitive keys like 'patient_id' or 'ssn' in labels."
            ]
        },
        {
            "condition": "non-compliant label keys",
            "attribute_path": ["labels"],
            "values": ["patient_id", "ssn", "user_id", "confidential", "pii"],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_hl7_v2_store",
    "friendly_resource_name": "Google Cloud Healthcare HL7v2 Store",
    "resource_value_name": "labels"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
