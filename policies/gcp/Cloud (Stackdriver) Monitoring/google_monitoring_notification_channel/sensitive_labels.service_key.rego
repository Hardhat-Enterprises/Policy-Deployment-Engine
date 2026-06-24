package terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.sensitive_labels_service_key
import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.vars
conditions := [
  [
    {
      "situation_description": "labels.service_key is set directly, which may expose a sensitive service key in plain labels",
      "remedies": [
        "Move service_key from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "service_key must not be set in labels",
      "attribute_path": ["labels", "service_key"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
