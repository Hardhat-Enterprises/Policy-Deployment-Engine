resource "google_artifact_registry_repository_iam_member" "compliant_example_1" {
  project    = "my-project-id"
  location   = "australia-southeast1"
  repository = "my-repo"
  role       = "roles/artifactregistry.reader"
  member     = "user:jane@example.com"
}
