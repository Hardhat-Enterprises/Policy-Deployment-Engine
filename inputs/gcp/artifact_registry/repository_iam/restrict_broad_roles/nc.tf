# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_artifact_registry_repository_iam_member" "nc" {
  repository = "my-risky-repo"
  location   = "AU"
  project    = "your-gcp-project-id"
  role       = "roles/owner"
  member     = "user:risky.user@example.com"
}
