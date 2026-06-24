resource "google_apigee_instance" "nc" {
  name     = "nc"
  location = "us-central1"
  org_id   = "organizations/pde-org"
  ip_range = "10.87.8.0/16"
}