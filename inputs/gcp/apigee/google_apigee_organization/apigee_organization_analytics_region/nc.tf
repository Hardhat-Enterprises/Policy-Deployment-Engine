resource "google_apigee_organization" "nc" {
  project_id          = "nc"
  analytics_region    = "us-east1"
  disable_vpc_peering = true
}
