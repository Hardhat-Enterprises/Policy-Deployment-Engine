resource "google_artifact_registry_repository" "compliant_example_1" {
  project       = "my-project-id"
  location      = "australia-southeast1"
  repository_id = "my-repository"
  description   = "example docker repository with cmek"
  format        = "DOCKER"
  kms_key_name  = "projects/project-1/locations/australia-southeast1/keyRings/artifact-ring/cryptoKeys/artifact-key"
  depends_on = [

  ]
}
