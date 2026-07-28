resource "google_firebase_app_hosting_traffic" "non_compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  backend = "non_compliant_example_1"
  location = "australia-southeast2-a"
  
  rollout_policy {
    disabled = false
    codebase_branch = "dev"  # Non-compliant: Uses development branch for automatic rollouts
  }
}
