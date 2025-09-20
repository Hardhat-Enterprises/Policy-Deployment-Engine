resource "google_dataplex_zone" "ok" {
  project  = "dummy-project"
  name     = "zone-type-ok"
  lake     = "test-lake"
  location = "us-central1"
  type     = "RAW" 

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }

  labels = { owner = "pde" }
}
