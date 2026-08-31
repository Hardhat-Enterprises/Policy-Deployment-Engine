package terraform.gcp.security.customer_engagement_suite.google_ces_app.client_certificate_settings_tls_certificate

import data.terraform.helpers
import data.terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

conditions := [
  [
    {
      "situation_description": "CES app client certificate TLS configuration must use an approved certificate value.",
      "remedies": ["Configure tls_certificate with an approved certificate value."]
    },
    {
      "condition": "TLS certificate must use an approved certificate value",
      "attribute_path": ["client_certificate_settings", 0, "tls_certificate"],
      "values": ["-----BEGIN CERTIFICATE-----\nVALID-CERTIFICATE-DATA\n-----END CERTIFICATE-----"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details