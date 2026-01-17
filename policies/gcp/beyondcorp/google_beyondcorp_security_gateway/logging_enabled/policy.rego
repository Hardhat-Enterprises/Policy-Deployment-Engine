package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.logging_enabled

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.vars

conditions := [
  [
    {
      "situation_description": "Logging is not enabled for the BeyondCorp Security Gateway.",
      "remedies": [
        "Enable logging to ensure auditability, monitoring, and forensic investigation capabilities."
      ]
    },
    {
      "condition": "Security Gateway logging must be enabled.",
      "attribute_path": ["logging_config", 0, "enable"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
