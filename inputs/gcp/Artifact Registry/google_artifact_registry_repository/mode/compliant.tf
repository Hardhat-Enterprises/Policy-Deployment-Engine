# Compliant — one per scenario
# c1: approved remote upstream URI
resource "google_artifact_registry_repository" "compliant_example_1" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-c1-approved-remote"
  description   = "remote repo with approved upstream"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description = "pull-through cache of another Artifact Registry repository"
    common_repository {
      uri = "https://australia-southeast1-docker.pkg.dev/trusted-project/base-images"
    }
  }
}

# c2: upstream validation enabled
resource "google_artifact_registry_repository" "compliant_example_2" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-c2-validation"
  description   = "remote dockerhub repo with validation enabled"
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

# c3: virtual upstream priority in range
resource "google_artifact_registry_repository" "compliant_example_3" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-c3-virtual"
  description   = "virtual docker repo with in-range priorities"
  format        = "DOCKER"
  mode          = "VIRTUAL_REPOSITORY"
  virtual_repository_config {
    upstream_policies {
      id         = "upstream-1"
      repository = "upstream-id-1"
      priority   = 20
    }
    upstream_policies {
      id         = "upstream-2"
      repository = "upstream-id-2"
      priority   = 10
    }
  }
}
