resource "google_artifact_registry_repository_iam_member" "nc" {
  repository = "public-repo"
  location   = "AU"
  project    = "your-project-id"
  role       = "roles/artifactregistry.reader"
  member     = "allUsers"
}
