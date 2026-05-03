package terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.force_delete_false

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.vars

conditions := [
  [
    {
      "situation_description": "force_delete is set to true, which allows the notification channel to be deleted even if alert policies still reference it",
      "remedies": [
        "Set force_delete to false or remove the attribute"
      ]
    },
    {
      "condition": "force_delete must not be true",
      "attribute_path": ["force_delete"],
      "policy_type": "whitelist",
      "values": [null, false]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
