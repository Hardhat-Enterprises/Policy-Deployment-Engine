# Compliant example for user_id policy
resource "google_alloydb_user" "c" {
  cluster   = "projects/p/locations/us-central1/clusters/cluster-c"
  user_id   = "pde_allowed_user" # passes reserved-name check
  user_type = "ALLOYDB_BUILT_IN" # valid enum
}
