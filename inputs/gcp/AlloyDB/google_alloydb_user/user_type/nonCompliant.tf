resource "google_alloydb_user" "non_compliant_example_1" {
  cluster   = "non_compliant_example_1"
  user_id   = "dbapp_user" 
  user_type = "ALLOYDB_BUILT_IN"
}
