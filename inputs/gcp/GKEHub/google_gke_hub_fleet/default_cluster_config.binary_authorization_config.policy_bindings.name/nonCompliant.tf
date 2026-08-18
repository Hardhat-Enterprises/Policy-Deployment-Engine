resource "google_gke_hub_fleet" "non_compliant_example_1" {
project      = "example-project-123"
  display_name = "non_compliant_example_1"
  default_cluster_config {
    binary_authorization_config {
      evaluation_mode = "POLICY_BINDINGS"
      policy_bindings {
        name = "projects/a/platforms/gke/policies/dev"
      }
    }
  }
}
