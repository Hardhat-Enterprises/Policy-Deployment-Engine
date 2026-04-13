resource "google_artifact_registry_repository" "nc" {
  project       = data.google_project.nc.project_id
  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository with cmek"
  format        = "DOCKER"
  kms_key_name  = "projects/project-1/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key"
  depends_on = [

  ]
}


data "google_project" "nc" {
  project_id = "pde-dev-493206"
}