resource "google_artifact_registry_repository" "nc" {
  project       = "my-project"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example maven repository"
  format        = "MAVEN"

  maven_config {
    allow_snapshot_overwrites = true
  }
}