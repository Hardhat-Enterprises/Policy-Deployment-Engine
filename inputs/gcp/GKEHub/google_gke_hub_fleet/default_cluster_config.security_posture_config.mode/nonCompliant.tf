resource "google_gke_hub_fleet" "non_compliant_example_1" {
  project      = "1234"
  display_name = "non-compliant-fleet"

  default_cluster_config {
    security_posture_config {
      mode = "DISABLED"
    }
  }
}