package terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.folder_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_folders_policy_binding.folder_validation.vars

conditions := [
  [
    {
      "situation_description": "Folder must be a valid numeric GCP folder ID",
      "remedies": [
        "Provide a valid numeric folder ID",
        "Example: 224774388"
      ]
    },
    {
      "condition": "Validate folder format using pattern",
      "attribute_path": ["folder"],
      "values": ["^[0-9]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details