resource "google_artifact_registry_repository" "c" {
  project       = "my-project"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}