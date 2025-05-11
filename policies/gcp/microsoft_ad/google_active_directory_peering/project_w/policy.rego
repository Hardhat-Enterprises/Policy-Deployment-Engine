package terraform.gcp.security.microsoft_ad.google_active_directory_peering.project_w

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_peering.vars

# Only allow secure/approved projects to be used
conditions := [
  [
    {
      "situation_description": "Active Directory peering is configured under an unapproved GCP project.",
      "remedies": [
        "Use only approved project IDs like 'secure-project' for Active Directory peering configurations."
      ]
    },
    {
      "condition": "Ensure project is in the whitelist of approved GCP project IDs.",
      "attribute_path": ["project"],
      "values": ["secure-project", "prod-directory-project"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
