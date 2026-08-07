resource "google_compute_global_network_endpoint" "compliant_example_1" {
  global_network_endpoint_group = "projects/fake-project/global/networkEndpointGroups/compliant-neg"
  ip_address                    = "203.0.113.10"
  port                            = 90
}
