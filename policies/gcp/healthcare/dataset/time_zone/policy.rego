package terraform.gcp.security.healthcare.dataset.time_zone

import data.terraform.gcp.helpers

scenarios_list := [
    # SCENARIO 1
    [
        {
            "situation_description": "Non-compliant time_zone setting.",
            "remedies": ["Use UTC+10:00 as time_zone."]
        },
        {
            "condition": "non-compliant time_zone",
            "attribute_path": ["time_zone"],
            "values": ["UTC+5:00"],  # explicitly blacklist this
            "policy_type": "blacklist"
        }
    ]
]

# Define the required input for helper
variables := {
    "resource_type": "google_healthcare_dataset",
    "friendly_resource_name": "Google Cloud Healthcare Dataset",
    "resource_value_name": "time_zone"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
