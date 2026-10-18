resource "google_apigee_organization" "non_compliant_example_1" {
  project_id          = "non_compliant_example_1"
  analytics_region    = "us-central1"
  disable_vpc_peering = true
  retention           = "DELETION_RETENTION_UNSPECIFIED"
}
