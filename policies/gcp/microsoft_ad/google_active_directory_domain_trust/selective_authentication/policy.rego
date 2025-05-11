package terraform.gcp.security.microsoft_ad.google_active_directory_domain_trust.selective_authentication

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain_trust.vars

# Enforce that selective_authentication must be enabled (true)
conditions := [
  [
    {
      "situation_description": "Selective Authentication is disabled.",
      "remedies": [
        "Set selective_authentication = true to restrict access between trusted domains"
      ]
    },
    {
      "condition": "Ensure selective_authentication is enabled.",
      "attribute_path": ["selective_authentication"],
      "values": [false],
      "policy_type": "blacklist"
    }
  ]
]

# Summary message shown in OPA eval output
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed results (optional for inspection)
details := helpers.get_multi_summary(conditions, vars.variables).details
