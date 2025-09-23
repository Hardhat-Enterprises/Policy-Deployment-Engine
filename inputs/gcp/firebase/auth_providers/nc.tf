# Non-compliant Firebase Auth provider using Facebook
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_identity_platform_default_supported_idp_config" "nc" {
  enabled = true
  idp_id  = "facebook.com"
  client_id     = "valid-client-id"
  client_secret = "valid-secret"
}