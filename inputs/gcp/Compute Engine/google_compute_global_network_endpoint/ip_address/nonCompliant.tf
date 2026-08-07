resource "google_compute_global_network_endpoint" "non_compliant_example_1" {
  global_network_endpoint_group = "projects/fake-project/global/networkEndpointGroups/noncompliant-neg"
  ip_address                    = "198.51.100.20"
  port                            = 90
}
