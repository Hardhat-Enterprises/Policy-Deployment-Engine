resource "google_network_security_server_tls_policy" "nc" {
    
  name       = "nc"
  project    = "123"
  location   = "global"
  allow_open = false
}