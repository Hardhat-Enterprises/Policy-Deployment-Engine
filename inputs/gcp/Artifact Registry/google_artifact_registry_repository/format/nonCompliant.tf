resource "google_artifact_registry_repository" "non_compliant_example_1" {
  project       = "my-project"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}

resource "google_artifact_registry_repository" "non_compliant_example_2" {
  project       = "my-project"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example maven repository"
  format        = "MAVEN"

  maven_config {
    allow_snapshot_overwrites = true
  }
}
