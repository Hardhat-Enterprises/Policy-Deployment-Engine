package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.endpoint_hostname_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.vars

conditions := [
  [
    {
      "situation_description": "Endpoint ports are outside approved list.",
      "remedies": ["Use ports 443 or 8443 only."]
    },
    {
      "condition": "Endpoint ports must be within the allowed set.",
      "attribute_path": ["endpoint_matchers",0,"ports"],
      "values": [443, 8443],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details