resource "google_apigee_organization" "c" {
  project_id          = "c"
  analytics_region    = "us-central1"
  disable_vpc_peering = true
  runtime_type        = "CLOUD"
}
