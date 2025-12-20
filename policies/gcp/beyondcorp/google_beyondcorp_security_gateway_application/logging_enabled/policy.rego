package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.logging_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.vars

conditions := [
  [
    {
      "situation_description": "Logging is not enabled for the BeyondCorp Security Gateway Application.",
      "remedies": [
        "Enable logging to ensure application access is auditable and supports security monitoring."
      ]
    },
    {
      "condition": "Logging must be enabled.",
      "attribute_path": ["logging_enabled"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
