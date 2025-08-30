resource "google_vmwareengine_network" "c" {
  project     = google_project_service.acceptance.project
  name        = "australia-southeast2-c-default" 
  location    = "australia-southeast2"
  type        = "STANDARD"
  description = "VMwareEngine legacy network sample"
}

resource "google_project_service" "acceptance" {
  project  = google_project.acceptance.project_id
  service  = "vmwareengine.googleapis.com"
}

resource "google_project" "acceptance" {
  name            = "vmw-proj"
  project_id      = "vmw-proj"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  deletion_policy = "DELETE"
}
