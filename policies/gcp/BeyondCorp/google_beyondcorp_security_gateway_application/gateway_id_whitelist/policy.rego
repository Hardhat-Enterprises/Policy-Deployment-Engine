package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.gateway_id_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.vars

conditions := [
  [
    {
      "situation_description": "The Security Gateway Application is using an unapproved gateway.",
      "remedies": ["Use a security_gateway_id from the approved list."]
    },
    {
      "condition": "Security Gateway ID must be approved",
      "attribute_path": ["security_gateway_id"],
      "values": ["default-sg", "default-sg-spa", "default-sg-spa-proxy"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
