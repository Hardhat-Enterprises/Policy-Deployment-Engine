package terraform.gcp.security.certificate_manager.google_certificate_manager_trust_config.approved_location

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_trust_config.vars

conditions := [
  [
    {
      "situation_description": "When a Certificate Manager trust config is created outside the approved location, trust configuration for mutual TLS may be deployed in an unapproved region.",
      "remedies": "Use the approved location for Certificate Manager trust configs."
    },
    {
      "condition": "Certificate Manager trust configs should use the approved location.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details