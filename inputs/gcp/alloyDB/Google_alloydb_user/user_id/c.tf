
resource "google_alloydb_user" "c" {
  cluster   = "c"
  user_id   = "pde_allowed_user"
  user_type = "ALLOYDB_BUILT_IN"
}
