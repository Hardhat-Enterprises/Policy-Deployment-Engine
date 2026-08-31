resource "google_compute_global_network_endpoint" "non_compliant_example_1" {
  global_network_endpoint_group = "non_compliant_example_1"
  fqdn                           = "www.example.com"
  port                            = 90
  deletion_policy                 = "DELETE"
}
