# Compliant Firebase Auth provider using Google
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_identity_platform_default_supported_idp_config" "c" {
  enabled = true
  idp_id  = "google.com"
  client_id     = "valid-client-id"
  client_secret = "valid-secret"
}