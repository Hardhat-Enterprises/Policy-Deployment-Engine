resource "google_compute_global_network_endpoint_group" "compliant_example_1" {
  name                   = "compliant-neg"
  network_endpoint_type  = "INTERNET_FQDN_PORT"
  default_port           = 90
  deletion_policy        = "PREVENT"
}
