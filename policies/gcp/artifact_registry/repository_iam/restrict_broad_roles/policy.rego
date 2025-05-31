package terraform.gcp.security.artifact_registry.repository_iam.restrict_broad_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  [
    {
      "situation_description": "Repository IAM binding includes a role that is not explicitly allowed (e.g., overly permissive roles like roles/owner or roles/editor).",
      "remedies": [
        "Use only least privilege roles such as roles/artifactregistry.reader or roles/artifactregistry.writer.",
        "Remove roles like roles/owner or roles/editor from Artifact Registry IAM bindings."
      ]
    },
    {
      "condition": "Allow only specific least-privileged roles for Artifact Registry.",
      "attribute_path": ["role"],
      "values": [
        "roles/artifactregistry.reader",
        "roles/artifactregistry.writer",
        "roles/artifactregistry.admin"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
