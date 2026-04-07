resource "google_artifact_registry_repository_iam_binding" "nc" {
  project = "my-project-id"
  location = "australasia-southeast1"
  repository = "nc"
  role = "roles/artifactregistry.reader"
  members = [
    "allUsers",
    "allAuthenticatedUsers",
    "user:jane@example.com",
  ]
}