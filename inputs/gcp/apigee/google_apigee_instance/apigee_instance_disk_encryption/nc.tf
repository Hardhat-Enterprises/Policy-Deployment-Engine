resource "google_apigee_instance" "nc" {
  name     = "nc"
  location = "us-central1"
  org_id   = "organizations/pde-org"
}