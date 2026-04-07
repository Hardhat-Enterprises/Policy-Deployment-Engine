resource "google_artifact_registry_repository_iam_binding" "nc" {
  project = "my-project-id"
  location = "australia-southeast1"
  repository = "my-repo"
  role = "roles/editor"
  members = [
    "user:jane@example.com",
  ]
}