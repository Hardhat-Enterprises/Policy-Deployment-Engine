resource "google_network_security_backend_authentication_config" "compliant_example_1" {
  name              = "compliant_example_1"
  client_certificate = "projects/example-project/locations/global/certificates/example-cert"
}
