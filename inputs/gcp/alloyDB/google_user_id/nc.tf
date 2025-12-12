resource "google_alloydb_user" "nc" {
  cluster   = "dummy-cluster"
  user_id   = "admin"
  user_type = "ALLOYDB_BUILT_IN"
}
