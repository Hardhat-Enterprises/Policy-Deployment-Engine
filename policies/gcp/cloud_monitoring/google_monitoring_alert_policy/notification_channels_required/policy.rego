package terraform.gcp.security.cloud_monitoring.google_monitoring_alert_policy.notification_channels_required

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_alert_policy.vars

# This policy enforces that alert policies must configure at least one
# notification channel so alerts can notify responders when triggered.

conditions := [
  [
    {
      "situation_description": "Notification channels are missing",
      "remedies": [
        "Set notification_channels to include at least one valid monitoring notification channel resource name."
      ]
    },
    {
      "condition": "notification_channels must be set",
      "attribute_path": ["notification_channels"],
      "policy_type": "blacklist",
      "values": [null, []]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
