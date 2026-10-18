resource "google_network_security_backend_authentication_config" "compliant_example_1" {
  name         = "compliant_example_1"
  trust_config = "projects/example-project/locations/global/trustConfigs/example-trust-config"
}
