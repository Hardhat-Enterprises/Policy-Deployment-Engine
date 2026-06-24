package terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.auth_token
import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.vars
conditions := [
  [
    {
      "situation_description": "labels.auth_token is set directly, which may expose a sensitive token in plain labels",
      "remedies": [
        "Move auth_token from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "auth_token must not be set in labels",
      "attribute_path": ["labels", "auth_token"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
