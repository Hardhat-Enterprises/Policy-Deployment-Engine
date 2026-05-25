package terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.password
import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.vars
conditions := [
  [
    {
      "situation_description": "labels.password is set directly, which may expose a sensitive password in plain labels",
      "remedies": [
        "Move password from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "password must not be set in labels",
      "attribute_path": ["labels", "password"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
