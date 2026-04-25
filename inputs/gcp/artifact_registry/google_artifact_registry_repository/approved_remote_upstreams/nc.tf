resource "google_artifact_registry_repository" "nc" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "example-common-remote"
  description   = "example remote common repository with docker upstream"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description = "pull-through cache of another Artifact Registry repository"
    common_repository {
      uri = "https://australia-southeast1-docker.pkg.dev/trusted-project/final-images"
    }
  }
}