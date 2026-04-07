resource "google_artifact_registry_repository_iam_member" "nc" {
  project = "my-project-id"
  location = "australia-southeast1"
  repository = "my-repo"
  role = "roles/artifactregistry.reader"
  member = "allUsers"
}