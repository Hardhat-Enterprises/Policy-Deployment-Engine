resource "google_apigee_instance" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  org_id   = "organizations/pde-org"
  ip_range = "10.87.8.0/16"
}
