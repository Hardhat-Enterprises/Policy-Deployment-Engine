package terraform.gcp.security.microsoft_ad.google_active_directory_domain_trust.selective_authentication_w

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain_trust.vars

# Only allow selective_authentication = true
conditions := [
  [
    {
      "situation_description": "Selective authentication is disabled in domain trust settings.",
      "remedies": [
        "Set selective_authentication = true to enforce tighter access control over trusted domains."
      ]
    },
    {
      "condition": "Ensure selective_authentication is explicitly enabled.",
      "attribute_path": ["selective_authentication"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
