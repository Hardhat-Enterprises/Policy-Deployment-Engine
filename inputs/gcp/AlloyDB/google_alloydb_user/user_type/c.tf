resource "google_alloydb_user" "c" {
  cluster   = "c"
  user_id   = "analyst@example.com"
  user_type = "ALLOYDB_IAM_USER"
}
