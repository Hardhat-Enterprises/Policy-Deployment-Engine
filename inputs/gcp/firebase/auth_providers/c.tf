# Compliant Firebase Auth provider using Google
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_identity_platform_oauth_idp_config" "c" {
  provider      = "google.com"
  client_id     = "valid-client-id"
  client_secret = "valid-secret"
}

