resource "google_alloydb_user" "c" {
  cluster   = "projects/p/locations/us-central1/clusters/cluster-c"
  user_id   = "analyst@example.com"
  user_type = "ALLOYDB_IAM_USER"
}
