package terraform.gcp.security.dataform.google_dataform_repository_iam.iam_no_public

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_iam.vars

conditions := [
  [
    {
      "situation_description": "Repository IAM must not grant public access (allUsers/allAuthenticatedUsers).",
      "remedies": [
        "Remove allUsers and allAuthenticatedUsers from IAM members.",
        "Use specific user/service account identities instead."
      ]
    },
    {
      "condition": "No public access allowed",
      "attribute_path": ["bindings", 0, "members", 0],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
