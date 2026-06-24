# Non-compliant: token_ttl is 604800s (7 days) — exceeds the 86400s (24h) maximum
# A 7-day bearer token dramatically widens the replay attack window if intercepted.
resource "google_firebase_app_check_device_check_config" "nc" {
  app_id      = "nc"
  key_id      = "non-compliant-key-id"
  private_key = "projects/my-project/secrets/my-key"
  token_ttl   = "604800s"
}
