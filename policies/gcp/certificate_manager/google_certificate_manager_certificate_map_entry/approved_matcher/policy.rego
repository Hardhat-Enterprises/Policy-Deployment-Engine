package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.approved_matcher

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.vars

conditions := [
  [
    {
      "situation_description": "When a certificate map entry uses a non-approved matcher value, certificate map routing may not follow the expected matching configuration.",
      "remedies": "Use an approved matcher value for certificate map entries."
    },
    {
      "condition": "Certificate map entries should use an approved matcher value.",
      "attribute_path": ["matcher"],
      "values": [null, "PRIMARY"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details