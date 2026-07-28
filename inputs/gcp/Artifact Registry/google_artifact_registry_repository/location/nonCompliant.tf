resource "google_artifact_registry_repository" "non_compliant_example_1" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}
