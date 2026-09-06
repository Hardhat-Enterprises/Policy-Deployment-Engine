resource "google_compute_global_network_endpoint_group" "non_compliant_example_1" {
  name                   = "noncompliant-neg"
  network_endpoint_type  = "INTERNET_FQDN_PORT"
  default_port           = 90
  deletion_policy        = "DELETE"
}
