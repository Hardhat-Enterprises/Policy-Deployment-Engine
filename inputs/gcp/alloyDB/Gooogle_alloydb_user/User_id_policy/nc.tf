# Non-compliant example for user_id policy
resource "google_alloydb_user" "nc" {
  cluster   = "projects/p/locations/us-central1/clusters/placeholder"
  user_id   = "root" # <-- value that SHOULD FAIL your policy
  user_type = "ALLOYDB_BUILT_IN"
}
