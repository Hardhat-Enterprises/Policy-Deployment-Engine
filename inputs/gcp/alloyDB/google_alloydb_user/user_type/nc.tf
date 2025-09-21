resource "google_alloydb_user" "nc" {
  cluster   = "projects/p/locations/us-central1/clusters/cluster-nc"
  user_id   = "dbapp_user" # example name
  user_type = "ALLOYDB_BUILT_IN"
}
