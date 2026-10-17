resource "google_artifact_registry_repository" "compliant_example_1" {
  project       = "my-project-id"
  location      = "australia-southeast1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}
