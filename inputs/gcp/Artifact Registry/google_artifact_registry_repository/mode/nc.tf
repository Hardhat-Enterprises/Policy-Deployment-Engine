# Non-compliant — one per scenario, each highlighting a different violation
# nc1: scenario 1 — REMOTE repo with an unapproved upstream URI
resource "google_artifact_registry_repository" "nc1" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-nc1-bad-uri"
  description   = "remote repo with unapproved upstream URI"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description = "pull-through cache of another Artifact Registry repository"
    common_repository {
      uri = "https://australia-southeast1-docker.pkg.dev/trusted-project/final-images"
    }
  }
}

# nc2: scenario 2 — REMOTE repo with upstream validation disabled
resource "google_artifact_registry_repository" "nc2" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-nc2-no-validation"
  description   = "remote dockerhub repo with validation disabled"
  format        = "DOCKER"
  mode          = "REMOTE_REPOSITORY"
  remote_repository_config {
    description                 = "docker hub with custom credentials"
    disable_upstream_validation = true
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

# nc3: scenario 3 — VIRTUAL repo with out-of-range upstream priority
resource "google_artifact_registry_repository" "nc3" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "mode-nc3-bad-priority"
  description   = "virtual docker repo with out-of-range priorities"
  format        = "DOCKER"
  mode          = "VIRTUAL_REPOSITORY"
  virtual_repository_config {
    upstream_policies {
      id         = "upstream-1"
      repository = "upstream-id-1"
      priority   = 200
    }
    upstream_policies {
      id         = "upstream-2"
      repository = "upstream-id-2"
      priority   = 100
    }
  }
}
