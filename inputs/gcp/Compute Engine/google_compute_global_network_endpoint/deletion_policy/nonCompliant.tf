resource "google_compute_global_network_endpoint" "non_compliant_example_1" {
  global_network_endpoint_group = "projects/fake-project/global/networkEndpointGroups/noncompliant-neg"
  fqdn                           = "www.example.com"
  port                            = 90
  deletion_policy                 = "DELETE"
}
