resource "google_artifact_registry_repository" "c" {
  project       = "my-project-id"
  location      = "australia-southeast1-a"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}