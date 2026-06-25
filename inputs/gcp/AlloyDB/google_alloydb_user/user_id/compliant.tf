resource "google_alloydb_user" "compliant_example_1" {
  cluster   = "compliant_example_1"
  user_id   = "pde_allowed_user" 
  user_type = "ALLOYDB_BUILT_IN" 
}
