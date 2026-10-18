resource "google_network_security_backend_authentication_config" "non_compliant_example_1" {
  name              = "non_compliant_example_1"
  well_known_roots  = "PUBLIC_ROOTS"
}
