package terraform.gcp.security.microsoft_ad.google_active_directory_domain.deletion_protection_b

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Block deletion_protection = false for security
conditions := [
  [
    {
      "situation_description": "Deletion protection is disabled for the Active Directory domain.",
      "remedies": [
        "Set deletion_protection = true to prevent accidental or malicious deletion of critical directory domains."
      ]
    },
    {
      "condition": "Ensure deletion_protection is not disabled.",
      "attribute_path": ["deletion_protection"],
      "values": [false],
      "policy_type": "blacklist"
    }
  ]
]

# Summary output
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
