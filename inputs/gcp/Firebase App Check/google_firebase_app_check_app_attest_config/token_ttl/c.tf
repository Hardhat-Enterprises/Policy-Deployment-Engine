# Compliant: token_ttl is 3600s (1 hour) — within the 86400s (24h) maximum
resource "google_firebase_app_check_app_attest_config" "c" {
  app_id    = "c"
  token_ttl = "3600s"
}
