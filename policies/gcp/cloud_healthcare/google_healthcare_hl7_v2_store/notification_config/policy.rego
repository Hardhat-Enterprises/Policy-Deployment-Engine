package terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.notification_config

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.vars

# Validate that notification_configs is configured with a Pub/Sub topic.
# Without notifications, HL7v2 message ingestion events cannot be audited
# or monitored in real time — a requirement for HIPAA audit controls.
conditions := [
    [
    {"situation_description" : "HL7v2 Store does not have a notification_configs Pub/Sub topic configured",
    "remedies": [
        "Add a notification_configs block with a valid Pub/Sub topic",
        "Example: notification_configs { pubsub_topic = \"projects/PROJECT/topics/TOPIC\" }"
    ]},
    {
        "condition": "Check if notification_configs pubsub_topic is not null or empty",
        "attribute_path" : ["notification_configs", 0, "pubsub_topic"],
        "values" : [null, ""],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
