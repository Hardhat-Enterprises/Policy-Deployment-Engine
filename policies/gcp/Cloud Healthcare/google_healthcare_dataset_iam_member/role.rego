package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Dataset IAM role must not be a primitive role — grants overly broad access across ALL stores in the dataset",
      "remedies": [
        "Replace primitive roles with a specific healthcare dataset role",
        "Approved roles: roles/healthcare.datasetViewer, roles/healthcare.datasetAdmin"
      ]
    },
    {
      "condition":      "Check if role is not a primitive role",
      "attribute_path": ["role"],
      "values":         ["roles/owner", "roles/editor", "roles/viewer"],
      "policy_type":    "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
