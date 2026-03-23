# Non-compliant: token_ttl is 86401s (24h + 1s) — boundary failure
# This exceeds the 86400s (24h) maximum permitted for security.
resource "google_firebase_app_check_device_check_config" "nc2" {
  app_id      = "projects/my-project/apps/app1"
  key_id      = "boundary-key-id"
  private_key = "projects/my-project/secrets/my-key"
  token_ttl   = "86401s"
}
