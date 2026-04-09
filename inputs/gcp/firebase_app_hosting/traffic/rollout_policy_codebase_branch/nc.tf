resource "google_firebase_app_hosting_traffic" "nc" {
  project = "grounded-jetty-469512-j6"
  backend = "nc"
  location = "australia-southeast2-a"
  
  rollout_policy {
    disabled = false
    codebase_branch = "dev"  # Non-compliant: Uses development branch for automatic rollouts
  }
}