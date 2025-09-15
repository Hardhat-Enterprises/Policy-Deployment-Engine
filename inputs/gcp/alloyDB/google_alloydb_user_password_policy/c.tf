resource "google_alloydb_user" "c" {
  cluster    = "projects/pde-demo/locations/us-central1/clusters/cluster-users"
  user_id    = "svc_app"
  user_type  = "ALLOYDB_BUILT_IN"
  password   = "Str0ng!Pass1"
  database_roles = ["app_reader"]
}
