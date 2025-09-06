resource "google_alloydb_user" "nc" {
  cluster    = "projects/pde-demo/locations/us-central1/clusters/cluster-users"
  user_id    = "svc_bad"
  user_type  = "ALLOYDB_BUILT_IN"
  password   = "weakpass"
  database_roles = ["app_reader"]
}
