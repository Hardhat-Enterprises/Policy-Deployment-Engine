package terraform.gcp.security.microsoft_ad.google_active_directory_domain.admin

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Enforce that admin email must NOT be from public domains like gmail.com, yahoo.com etc.
conditions := [
  [
    {
      "situation_description": "Admin email is using an insecure public domain (e.g., gmail.com).",
      "remedies": [
        "Use a secure organization-managed domain (e.g., admin@secure-domain.org)"
      ]
    },
    {
      "condition": "Ensure admin email does not use public email providers.",
      "attribute_path": ["admin"],
      "values": ["admin@gmail.com", "admin@yahoo.com", "admin@outlook.com"],
      "policy_type": "blacklist"
    }
  ]
]

# General summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource messages
details := helpers.get_multi_summary(conditions, vars.variables).details
