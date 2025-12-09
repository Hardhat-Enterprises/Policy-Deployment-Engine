package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.logging_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.vars

conditions := [
  [
    {
      "situation_description": "Logging is not enabled for the App Connector.",
      "remedies": ["Enable logging to ensure auditability and incident response readiness."]
    },
    {
      "condition": "Logging must be enabled on the App Connector.",
      "attribute_path": ["logging_enabled"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details