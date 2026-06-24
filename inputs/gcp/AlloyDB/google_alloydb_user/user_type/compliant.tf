resource "google_alloydb_user" "compliant_example_1" {
  cluster   = "compliant_example_1"
  user_id   = "analyst@example.com"
  user_type = "ALLOYDB_IAM_USER"
}
