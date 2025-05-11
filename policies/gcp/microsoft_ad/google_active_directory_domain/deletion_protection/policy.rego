package terraform.gcp.security.microsoft_ad.google_active_directory_domain.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Define the compliance condition
conditions := [
  [
    {
      "situation_description": "Resource does not have deletion protection enabled.",
      "remedies": [
        "Enable deletion protection to prevent accidental deletion of the Active Directory domain."
      ]
    },
    {
      "condition": "Ensure deletion_protection is enabled.",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

# Summary compliance message (general)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info (per resource)
details := helpers.get_multi_summary(conditions, vars.variables).details
