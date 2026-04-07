resource "google_artifact_registry_repository_iam_binding" "c" {
  project = "my-project-id"
  location = "australia-southeast1"
  repository = "my-repo"
  role = "roles/artifactregistry.reader"
  members = [
    "user:jane@example.com",
  ]
}