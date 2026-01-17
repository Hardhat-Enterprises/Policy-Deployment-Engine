
package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.tls_enforcement

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars

conditions := [
  [
    {
      "situation_description": "TLS is not enabled for the App Connection.",
      "remedies": ["Enable TLS for secure communication on the App Connection."]
    },
    {
      "condition": "TLS must be enabled on the App Connection",
      "attribute_path": ["application_endpoint", 0, "tls_enabled"],
      "values": [true],
      "policy_type": "boolean_enforcement"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details

