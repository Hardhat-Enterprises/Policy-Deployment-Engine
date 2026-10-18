# Non-compliant: token_ttl is 604800s (7 days) — exceeds the 86400s (24h) maximum
# A 7-day token dramatically widens the replay attack window if intercepted.
resource "google_firebase_app_check_app_attest_config" "non_compliant_example_1" {
  app_id    = "non_compliant_example_1"
  token_ttl = "604800s"
}
