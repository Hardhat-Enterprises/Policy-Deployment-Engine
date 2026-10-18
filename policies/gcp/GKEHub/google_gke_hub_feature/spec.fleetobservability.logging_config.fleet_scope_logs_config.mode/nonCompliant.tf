resource "google_gke_hub_feature" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "global"
  project  = "1234"

  spec {
    fleetobservability {
      logging_config {
        fleet_scope_logs_config {
          mode = "MODE_UNSPECIFIED"
        }
      }
    }
  }
}