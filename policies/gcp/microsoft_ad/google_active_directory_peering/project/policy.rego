package terraform.gcp.security.microsoft_ad.google_active_directory_peering.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_peering.vars

# Policy: Disallow certain insecure project names
conditions := [
  [
    {
      "situation_description": "Project name is insecure or uses a test label.",
      "remedies": [
        "Use secure and approved project name like 'secure-project'."
      ]
    },
    {
      "condition": "Ensure the project name is not insecure.",
      "attribute_path": ["project"],
      "values": ["unsecure-project", "test-project", "default"],
      "policy_type": "blacklist"
    }
  ]
]

# Summary for policy check
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed condition-wise output
details := helpers.get_multi_summary(conditions, vars.variables).details