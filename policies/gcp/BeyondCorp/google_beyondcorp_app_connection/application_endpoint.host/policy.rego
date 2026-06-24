package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.application_endpoint_host

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars

conditions := [
    [
  {
    "situation_description": "Application endpoint host is not an approved IP address.",
    "remedies": ["Use one of the approved IPs only."]
  },
  {
    "condition": "Endpoint host must match an approved IP address.",
    "attribute_path": ["application_endpoint", 0, "host"],
    "values": ["svc.internal"],
    "policy_type": "whitelist"
  }
]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details