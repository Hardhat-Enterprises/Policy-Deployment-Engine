resource "google_alloydb_user" "nc" {
  cluster   = "nc"
  user_id   = "dbapp_user"
  user_type = "ALLOYDB_BUILT_IN"
}
