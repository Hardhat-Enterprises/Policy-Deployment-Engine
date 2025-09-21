# Non-compliant example (violates reserved-name rule)
resource "google_alloydb_user" "nc" {
  cluster   = "projects/p/locations/us-central1/clusters/cluster-nc"
  user_id   = "root" # intentionally disallowed
  user_type = "ALLOYDB_BUILT_IN"
}
