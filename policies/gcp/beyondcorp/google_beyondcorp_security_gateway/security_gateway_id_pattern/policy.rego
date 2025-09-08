package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.security_gateway_id_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.security_gateway_id_pattern.vars

conditions := [
  [
    {
      "situation_description": "Security Gateway ID violates naming rules (must start with a letter, use only lowercase letters and hyphens, be 4–63 chars, and end with a letter/number).",
      "remedies": ["Use an ID matching: ^[a-z][a-z0-9-]{2,61}[a-z0-9]$ ."]
    },
    {
      "condition": "Security Gateway ID must match regex",
      "attribute_path": ["security_gateway_id"],
      "values": ["^[a-z][a-z0-9-]{2,61}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
