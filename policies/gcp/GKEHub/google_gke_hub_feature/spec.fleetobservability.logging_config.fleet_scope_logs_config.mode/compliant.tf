resource "google_gke_hub_feature" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "global"
  project  = "1234"

  spec {
    fleetobservability {
      logging_config {
        fleet_scope_logs_config {
          mode = "COPY"
        }
      }
    }
  }
}