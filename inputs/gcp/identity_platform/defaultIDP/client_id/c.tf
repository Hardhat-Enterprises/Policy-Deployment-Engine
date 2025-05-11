resource "google_identity_platform_default_supported_idp_config" "c" {
  project       = "identity_platform"
  idp_id        = "google.com"
  client_id     = "valid-client-id"          
  client_secret = "valid-client-secret"
}