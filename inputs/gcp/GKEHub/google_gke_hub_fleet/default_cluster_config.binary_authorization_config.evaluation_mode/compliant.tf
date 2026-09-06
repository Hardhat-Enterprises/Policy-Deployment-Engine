resource "google_gke_hub_fleet" "compliant_example_1" {
  project      = "1234"
  display_name = "compliant-fleet"

  default_cluster_config {
    binary_authorization_config {
      evaluation_mode = "POLICY_BINDINGS"
    }
  }
}