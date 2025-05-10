package terraform.gcp.security.healthcare.hl7_v2_store.notification_configs

import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars

scenarios_list := [
    [
        {
            "situation_description": "Notification config uses a public topic with no filter, risking message leakage.",
            "remedies": [
                "Avoid using public Pub/Sub topics for HL7v2 notification configs.",
                "Always apply filters to restrict message forwarding to relevant types."
            ]
        },
        {
            "condition": "non-compliant notification config",
            "attribute_path": ["notification_configs[*].pubsub_topic", "notification_configs[*].filter"],
            "values": ["projects/project/topics/public-topic", ""],
            "policy_type": "blacklist"
        }
    ]
]

variables := {
    "resource_type": "google_healthcare_hl7_v2_store",
    "friendly_resource_name": "Google Cloud Healthcare HL7v2 Store",
    "resource_value_name": "notification_configs"
}

summary := helpers.get_multi_summary(scenarios_list, variables)

message := summary.message
detail := summary.details
