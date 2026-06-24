resource "google_artifact_registry_repository" "nc" {
  project       = "my-project-id"
  depends_on    = []
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example virtual docker repository"
  format        = "DOCKER"
  mode          = "VIRTUAL_REPOSITORY"
  virtual_repository_config {
    upstream_policies {
      id         = "my-repository-upstream-1"
      repository = "my-repository-upstream-id-1"
      priority   = 200
    }
    upstream_policies {
      id         = "my-repository-upstream-2"
      repository = "my-repository-upstream-id-2"
      priority   = 100
    }
  }
}