resource "google_apigee_dns_zone" "nc" {
  org_id      = "Test"
  dns_zone_id = ""
  domain      = "test.com"
  description = "DNS zone for non-compliant resource"
  peering_config {
    target_project_id = ""
    target_network_id = ""
  }
}