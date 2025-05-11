
resource "google_artifact_registry_repository_iam_member" "nc" {
  repository = "secure-repo"
  location   = "AU"
  project    = "your-secure-project-id"
  role       = "roles/artifactregistry.reader"
  member     = "user:john.doe@gmail.com"
}
