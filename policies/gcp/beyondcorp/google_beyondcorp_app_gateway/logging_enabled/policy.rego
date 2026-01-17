package terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.logging_enabled

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.vars

conditions := [
  [
    {
      "situation_description": "Logging is not enabled for the BeyondCorp App Gateway.",
      "remedies": [
        "Enable logging to support auditing, monitoring, and incident response."
      ]
    },
    {
      "condition": "Logging must be enabled for App Gateway.",
      "attribute_path": ["logging_config", 0, "enable"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details