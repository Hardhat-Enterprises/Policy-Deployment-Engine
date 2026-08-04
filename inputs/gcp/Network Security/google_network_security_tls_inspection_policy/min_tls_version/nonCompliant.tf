resource "google_network_security_tls_inspection_policy" "non_compliant_example_1" {
  name             = "non_compliant_example_1"
  ca_pool          = "projects/example-project/locations/global/caPools/example-pool"
  min_tls_version  = "TLS_1_0"
}
