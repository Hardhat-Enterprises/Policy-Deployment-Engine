package terraform.gcp.security.microsoft_ad.google_active_directory_domain.admin_w

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Enforce that admin email MUST be from approved domains only
conditions := [
  [
    {
      "situation_description": "Admin email is not using an approved secure domain.",
      "remedies": [
        "Use an approved organization-managed domain like admin@secure-domain.org"
      ]
    },
    {
      "condition": "Ensure admin email uses only whitelisted secure email domains.",
      "attribute_path": ["admin"],
      "values": ["admin@secure-domain.org", "admin@enterprise.org"],
      "policy_type": "whitelist"
    }
  ]
]

# Summary and detailed results
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
