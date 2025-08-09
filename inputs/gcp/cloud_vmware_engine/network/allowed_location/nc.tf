resource "google_vmwareengine_network" "nc" {
  project     = google_project_service.acceptance_nc.project
  name        = "us-west1-nc-default" 
  location    = "us-west1"
  type        = "LEGACY"
  description = "VMwareEngine legacy network sample"
}

resource "google_project_service" "acceptance_nc" {
  project  = google_project.acceptance_nc.project_id
  service  = "vmwareengine.googleapis.com"
}

resource "google_project" "acceptance_nc" {
  name            = "vmw-proj"
  project_id      = "vmw-proj"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  deletion_policy = "DELETE"
}