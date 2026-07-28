package terraform.gcp.security.certificate_manager.google_certificate_manager_trust_config.allowlisted_certificates_pem_certificate

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_trust_config.vars

conditions := [
  [
    {
      "situation_description": "When a Certificate Manager trust config defines allowlisted certificates, those certificates may be treated as trusted exceptions during certificate validation.",
      "remedies": "Do not define allowlisted certificates in the trust config unless there is an approved exception."
    },
    {
      "condition": "Certificate Manager trust configs should not define allowlisted certificates directly.",
      "attribute_path": ["allowlisted_certificates", 0, "pem_certificate"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details