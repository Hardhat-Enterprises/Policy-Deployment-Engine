resource "google_gke_hub_fleet" "c" {
project      = "example-project-123"
  display_name = "c"
  default_cluster_config {
    binary_authorization_config {
      evaluation_mode = "POLICY_BINDINGS"
      policy_bindings {
        name = "projects/a/platforms/gke/policies/prod"
      }
    }
  }
}
