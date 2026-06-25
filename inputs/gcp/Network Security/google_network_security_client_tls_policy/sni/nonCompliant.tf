resource "google_network_security_client_tls_policy" "non_compliant_example_1" {

  name    = "non_compliant_example_1"
  project = "123"
  sni     = "insecure.com"
}
