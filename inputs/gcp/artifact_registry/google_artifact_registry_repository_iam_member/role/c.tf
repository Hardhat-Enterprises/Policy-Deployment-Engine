resource "google_artifact_registry_repository_iam_member" "c" {
  project = "my-project"
  location = "australia-southeast1"
  repository = "my-repo"
  role = "roles/artifactregistry.reader"
  member = "user:jane@example.com"
}