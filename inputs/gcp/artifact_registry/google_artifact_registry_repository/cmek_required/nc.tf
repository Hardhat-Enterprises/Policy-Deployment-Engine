resource "google_artifact_registry_repository" "nc" {
  project       = "my-project"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository with cmek"
  format        = "DOCKER"
  kms_key_name  = "kms-key"
  depends_on = [

  ]
}