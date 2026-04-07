package terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_member.vars

conditions := [
  [
  {"situation_description": "Artifact Registry Repository IAM member must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from role attribute", "Use Artifact Registry specific roles like roles/artifactregistry.reader, roles/artifactregistry.writer, or roles/artifactregistry.admin"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Artifact Registry roles",
    "attribute_path": ["role"], 
    "values": ["roles/*", [["artifactregistry.reader", "artifactregistry.writer", "artifactregistry.admin"]]], 
    "policy_type": "pattern whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details