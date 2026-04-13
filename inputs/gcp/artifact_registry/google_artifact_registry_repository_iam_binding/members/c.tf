resource "google_artifact_registry_repository_iam_binding" "c" {
  project    = "my-project-id"
  location   = "australasia-southeast1"
  repository = "c"
  role       = "roles/artifactregistry.reader"
  members = [
    "user:jane@example.com",
  ]
}