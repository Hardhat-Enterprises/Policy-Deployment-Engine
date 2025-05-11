resource "google_identity_platform_default_supported_idp_config" "nc" {
  project       = "identity_platform"
  idp_id        = "untrusted-idp.com"      #Not in allowed list
  client_id     = "valid-client-id"
  client_secret = "valid-client-secret"
}