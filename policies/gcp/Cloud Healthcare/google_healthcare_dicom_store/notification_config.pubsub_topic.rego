package terraform.gcp.security.cloud_healthcare.google_healthcare_dicom_store.notification_config_pubsub_topic

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dicom_store.vars

conditions := [
  [
    {
      "situation_description": "DICOM Store does not have a notification_config Pub/Sub topic configured — medical imaging operations cannot be audited",
      "remedies": [
        "Add a notification_config block with a valid Pub/Sub topic",
        "Example: notification_config { pubsub_topic = \"projects/PROJECT/topics/TOPIC\" }"
      ]
    },
    {
      "condition":      "Check if notification_config pubsub_topic is not null or empty",
      "attribute_path": ["notification_config", 0, "pubsub_topic"],
      "values":         [null, ""],
      "policy_type":    "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
