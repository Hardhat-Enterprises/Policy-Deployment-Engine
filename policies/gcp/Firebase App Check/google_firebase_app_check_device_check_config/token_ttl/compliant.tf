# Compliant: token_ttl is 3600s (1 hour) — within the 86400s (24h) maximum
resource "google_firebase_app_check_device_check_config" "compliant_example_1" {
  app_id      = "compliant_example_1"
  key_id      = "compliant-key-id"
  private_key = "projects/my-project/secrets/my-key"
  token_ttl   = "3600s"
}
