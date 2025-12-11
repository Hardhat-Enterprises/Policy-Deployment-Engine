package terraform.gcp.security.dataform.google_dataform_repository_iam.iam_no_public

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_iam as repo

# Disallow public principals on repository IAM bindings

conditions := [
  [
    {
      "situation_description": "Repository IAM binding exposes the repository to the public",
      "remedies": [
        "Remove public principals from members (allUsers, allAuthenticatedUsers)",
        "Grant access only to specific users, groups, or service accounts"
      ]
    },
    {
      "condition": "No public members allowed",
      "attribute_path": ["members"],
      "policy_type": "blacklist",
      "values": ["allUsers", "allAuthenticatedUsers"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details