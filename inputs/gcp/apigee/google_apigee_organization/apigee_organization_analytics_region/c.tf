resource "google_apigee_organization" "c" {
  project_id          = "c"
  analytics_region    = "australia-southeast1"
  disable_vpc_peering = true
}