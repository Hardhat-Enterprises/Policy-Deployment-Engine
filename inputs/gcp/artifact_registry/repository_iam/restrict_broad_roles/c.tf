/* This policy enforces the principle of least privilege by preventing the assignment of overly permissive IAM roles 
such as `roles/owner` and `roles/editor` to Artifact Registry repositories.
Assigning broad roles can lead to privilege escalation and unauthorized access, posing a significant security risk.
This policy ensures only specific, minimal-permission roles are allowed. */


resource "google_artifact_registry_repository_iam_member" "c" {
  repository = "my-secure-repo"
  location   = "AU"
  project    = "your-gcp-project-id"
  role       = "roles/artifactregistry.reader"
  member     = "user:secure.user@example.com"


}
