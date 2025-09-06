resource "google_alloydb_user" "c" {
  cluster   = "alloydb-secure-cluster"
  user_id   = "secure_user"
  user_type = "ALLOYDB_BUILT_IN"
  database_roles = ["reader"]
}
