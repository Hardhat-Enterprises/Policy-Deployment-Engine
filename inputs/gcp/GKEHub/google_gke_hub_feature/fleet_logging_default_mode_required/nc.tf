resource "google_gke_hub_feature" "nc" {
  name = "nc"
  location = "global"
  project  = "1234"
  spec {
    fleetobservability {
      logging_config {
        default_config {
          mode = "MODE_UNSPECIFIED"
        }
      }
    }
  }
}
