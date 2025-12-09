package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.tls_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.vars

conditions := [
  [
    {
      "situation_description": "TLS is not enabled for App Connector.",
      "remedies": ["Enable TLS for secure communications."]
    },
    {
      "condition": "TLS must be enabled.",
      "attribute_path": ["tls_enabled"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
