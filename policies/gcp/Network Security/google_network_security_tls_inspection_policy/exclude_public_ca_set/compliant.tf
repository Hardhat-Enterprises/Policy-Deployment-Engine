resource "google_network_security_tls_inspection_policy" "compliant_example_1" {
  name                    = "compliant_example_1"
  ca_pool                 = "projects/example-project/locations/global/caPools/example-pool"
  exclude_public_ca_set   = true
}
