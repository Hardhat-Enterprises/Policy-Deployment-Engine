resource "google_network_security_client_tls_policy" "c" {
    
  name = "c"
  project = "123"
  sni  = "secure.com"
}