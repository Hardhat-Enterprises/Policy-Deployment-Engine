resource "google_firebase_app_hosting_traffic" "compliant_example_1" {
  project = "grounded-jetty-469512-j6"
  backend = "compliant_example_1"
  location = "australia-southeast2-a"

  rollout_policy {
    disabled = false
    codebase_branch = "main"  # Compliant: Uses secure main branch for rollouts
  }
}
