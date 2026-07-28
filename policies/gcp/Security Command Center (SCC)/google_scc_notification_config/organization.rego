package terraform.gcp.security.scc.google_scc_notification_config.organization

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "Notification config must belong to an approved organization.",
      "remedies": ["Use the approved organization ID."]
    },
    {
      "condition": "Organization allowlist.",
      "attribute_path": ["organization"],
      "values": ["organizations/123456789012"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
