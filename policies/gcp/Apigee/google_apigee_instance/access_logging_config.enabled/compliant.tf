resource "google_apigee_instance" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  org_id   = "organizations/pde-org"

  access_logging_config {
    enabled = true
  }
}
