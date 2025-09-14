# Non-compliant Firebase Auth provider using Facebook
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_identity_platform_oauth_idp_config" "nc" {
  provider      = "google"
  client_id     = "invalid-client-id"
  client_secret = "invalid-secret"
}

