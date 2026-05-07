package terraform.gcp.security.cloud_monitoring.google_monitoring_alert_policy.enabled_required

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_alert_policy.vars

conditions := [
  [
    {
      "situation_description": "enabled is set to false, which disables the alert policy and prevents it from triggering incidents or notifications",
      "remedies": [
        "Set enabled to true to ensure the alert policy is active and can detect and respond to incidents"
      ]
    },
    {
      "condition": "enabled must be true",
      "attribute_path": ["enabled"],
      "policy_type": "whitelist",
      "values": [true]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
