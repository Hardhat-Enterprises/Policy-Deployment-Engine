resource "google_apigee_dns_zone" "non_compliant_example_1" {
  org_id                 = "PDE-Apigee-Org"
  dns_zone_id = "my-dns-zone-id"
  domain = "test.com"
  description = "DNS zone for compliant resource"
  peering_config {
    target_project_id = "my-project-id"
    target_network_id = "my-network-id"
  }
}
