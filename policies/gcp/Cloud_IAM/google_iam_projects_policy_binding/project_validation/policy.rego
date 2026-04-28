package terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.project_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_projects_policy_binding.vars

conditions := [
  [
    {
      "situation_description": "Project ID must be valid format (alphanumeric and hyphen allowed)",
      "remedies": ["Use valid GCP project ID format"]
    },
    {
      "condition": "Validate project format",
      "attribute_path": ["project"],
      "values": ["^[a-z][a-z0-9-]{4,28}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details