resource "google_firebase_app_hosting_traffic" "c" {
  project  = "grounded-jetty-469512-j6"
  backend  = "c"
  location = "australia-southeast2-a"

  rollout_policy {
    disabled        = false
    codebase_branch = "main" # Compliant: Uses secure main branch for rollouts
  }
}