package terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_policy.policy_data
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_policy.vars

conditions := [
  [
  {"situation_description": "Artifact Registry IAM policy must not grant overly broad roles like Owner/Editor",
   "remedies": ["Remove roles/owner, roles/editor, or other administrative roles from policy_data", "Use Artifact Registry specific roles like roles/artifactregistry.reader, roles/artifactregistry.writer, or roles/artifactregistry.admin"]},
  {
    "condition": "Block overly permissive roles (Owner/Editor) and allow only appropriate Artifact Registry roles",
    "attribute_path": ["policy_data"], 
    "values": ["\"role\":\"roles/*\"", [["artifactregistry.reader", "artifactregistry.writer", "artifactregistry.admin"]]],
    "policy_type": "pattern whitelist"
  }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details