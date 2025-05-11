package terraform.gcp.security.artifact_registry.repository_iam.restrict_broad_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  {
    "situation_description": "Repository IAM binding includes an overly permissive role (roles/owner or roles/editor).",
    "remedies": [
      "Replace with a least privilege role such as roles/artifactregistry.reader or roles/artifactregistry.writer."
    ]
  },
  {
    "condition": "Disallow overly broad IAM roles.",
    "attribute_path": ["role"],
    "values": ["roles/owner", "roles/editor"],
    "policy_type": "blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
