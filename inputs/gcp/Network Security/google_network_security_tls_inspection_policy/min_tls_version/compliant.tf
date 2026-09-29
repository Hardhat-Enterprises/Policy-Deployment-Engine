resource "google_network_security_tls_inspection_policy" "compliant_example_1" {
  name             = "compliant_example_1"
  ca_pool          = "projects/example-project/locations/global/caPools/example-pool"
  min_tls_version  = "TLS_1_2"
}
