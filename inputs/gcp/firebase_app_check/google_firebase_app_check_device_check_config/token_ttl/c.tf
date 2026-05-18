# Compliant: token_ttl is 3600s (1 hour) — within the 86400s (24h) maximum
resource "google_firebase_app_check_device_check_config" "c" {
  app_id      = "c"
  key_id      = "compliant-key-id"
  private_key = "projects/my-project/secrets/my-key"
  token_ttl   = "3600s"
}
