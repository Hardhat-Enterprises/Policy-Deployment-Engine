# Compliant example for user_id policy
resource "google_alloydb_user" "c" {
  cluster   = "projects/p/locations/us-central1/clusters/placeholder"
  user_id   = "pde_allowed_user" # <-- change to your allowed pattern if needed
  user_type = "ALLOYDB_BUILT_IN" # or "ALLOYDB_IAM_USER"
}
