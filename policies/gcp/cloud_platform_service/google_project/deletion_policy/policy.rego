package terraform.gcp.security.cloud_platform_service.google_project.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Enforce deletion guard at the project level
conditions := [
  [
    {
      "situation_description": "Projects must enable deletion protection.",
      "remedies": ["Set deletion_policy to PREVENT to avoid accidental deletion."]
    },
    {
      "condition": "Deletion protection not enabled",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]
 

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

