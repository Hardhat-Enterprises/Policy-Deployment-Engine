resource "google_gke_hub_fleet" "non_compliant_example_1" {
  project      = "1234"
  display_name = "non-compliant-fleet"

  default_cluster_config {
    binary_authorization_config {
      evaluation_mode = "DISABLED"
    }
  }
}