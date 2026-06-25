resource "google_network_security_client_tls_policy" "compliant_example_1" {

  name    = "compliant_example_1"
  project = "123"
  sni     = "secure.com"
}
