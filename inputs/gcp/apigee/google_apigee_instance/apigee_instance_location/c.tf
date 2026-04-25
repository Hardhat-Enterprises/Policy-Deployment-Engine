resource "google_apigee_instance" "c" {
  name     = "c"
  location = "us-central1"
  org_id   = "organizations/pde-org"
}