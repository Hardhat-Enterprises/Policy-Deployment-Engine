
resource "google_alloydb_user" "nc" {
  cluster   = "nc"
  user_id   = "root"
  user_type = "ALLOYDB_BUILT_IN"
}
