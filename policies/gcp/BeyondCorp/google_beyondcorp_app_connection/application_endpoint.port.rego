package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.application_endpoint_port

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars

conditions := [
    [
    {
      "situation_description": "Application endpoint port is not in the approved set.",
      "remedies": ["Use ports 443 or 8443 or 9443 only."]
    },
    {
      "condition": "Endpoint port must be within the allowed range.",
      "attribute_path": ["application_endpoint",0,"port"],
      "values": [443, 8443, 9443],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details