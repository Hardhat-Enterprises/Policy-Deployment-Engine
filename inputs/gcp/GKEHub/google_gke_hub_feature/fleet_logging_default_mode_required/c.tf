resource "google_gke_hub_feature" "c" {
  name     = "fleetobservability"
  location = "global"
  project  = "1234"
  spec {
    fleetobservability {
      logging_config {
        default_config {
          mode = "COPY"
        }
      }
    }
  }
}

