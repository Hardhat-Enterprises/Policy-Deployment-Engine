package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.target_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Target principal_set must match folder format",
      "remedies": ["Must use //cloudresourcemanager.googleapis.com/folders/{folder_id}"]
    },
    {
      "condition": "Validate principal_set format",
      "attribute_path": ["target"],
      "field": "principal_set",
      "values": ["^//cloudresourcemanager\\.googleapis\\.com/folders/[0-9]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details