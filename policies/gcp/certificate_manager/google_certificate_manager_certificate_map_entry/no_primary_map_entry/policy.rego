package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.no_primary_map_entry

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_map_entry.vars

conditions := [
  [
    {
      "situation_description": "When a certificate map entry is configured as a primary entry, it can be used as a fallback certificate entry when no hostname is provided or when no configured hostname can be matched.",
      "remedies": "Use hostname-based certificate map entries instead of configuring a primary certificate map entry."
    },
    {
      "condition": "Certificate map entries should not be configured as primary entries.",
      "attribute_path": ["matcher"],
      "values": ["PRIMARY"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details