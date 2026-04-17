resource "google_network_security_server_tls_policy" "c" {
    
  name       = "c"
  project    = "123"
  location   = "global"
  allow_open = false

  mtls_policy {
    client_validation_mode         = "REJECT_INVALID"
    client_validation_trust_config = "projects/123/locations/global/trustConfigs/tc"
  }
}