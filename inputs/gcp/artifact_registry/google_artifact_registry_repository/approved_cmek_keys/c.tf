resource "google_artifact_registry_repository" "c" {
  project       = "my-project-id"
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository with cmek"
  format        = "DOCKER"
  kms_key_name  = "projects/project-1/locations/us-central1/keyRings/artifact-ring/cryptoKeys/artifact-key"
  depends_on = [

  ]
}