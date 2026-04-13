data "google_project" "c" {
  project_id = "pde-dev-493206"
}

resource "google_artifact_registry_repository" "c" {
  project       = data.google_project.c.id
  location      = "us-central1"
  repository_id = "example-dockerhub-remote"
  description   = "example remote dockerhub repository with credentials"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description                 = "docker hub with custom credentials"
    disable_upstream_validation = false
    docker_repository {
      public_repository = "DOCKER_HUB"
    }
    upstream_credentials {
      username_password_credentials {
        username                = "remote-username"
        password_secret_version = "secret_version"
      }
    }
  }
}