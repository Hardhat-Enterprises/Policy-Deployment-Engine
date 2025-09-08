package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.application_id_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.application_id_pattern.vars

conditions := [
  [
    {
      "situation_description": "Application ID violates naming rules.",
      "remedies": ["Use ID matching regex: ^[a-z][a-z0-9-]{2,61}[a-z0-9]$ ."]
    },
    {
      "condition": "Application ID must match regex",
      "attribute_path": ["application_id"],
      "values": ["^[a-z][a-z0-9-]{2,61}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
