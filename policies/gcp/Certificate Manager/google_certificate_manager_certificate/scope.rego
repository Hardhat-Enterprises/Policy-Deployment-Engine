package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.scope

import data.terraform.helpers as helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate.vars as vars

conditions := [
  [
    {
      "situation_description": "When a certificate uses a non-approved scope, it may be served or used outside the organisation's intended certificate deployment boundary.",
      "remedies": "Use the approved certificate scope for Certificate Manager certificates."
    },
    {
      "condition": "Certificate Manager certificates should not use non-approved certificate scopes.",
      "attribute_path": ["scope"],
      "values": [null, "DEFAULT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
