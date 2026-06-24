resource "google_network_security_client_tls_policy" "nc" {

  name    = "nc"
  project = "123"
  sni     = "insecure.com"
}