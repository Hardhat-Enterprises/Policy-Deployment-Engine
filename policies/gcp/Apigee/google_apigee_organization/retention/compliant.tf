resource "google_apigee_organization" "compliant_example_1" {
  project_id          = "compliant_example_1"
  analytics_region    = "us-central1"
  disable_vpc_peering = true
  retention           = "MINIMUM"
}
