resource "google_dataplex_zone" "bad" {
  project  = "dummy-project"
  name     = "zone-location-bad"
  lake     = "test-lake"
  location = "us-central1"
  type     = "RAW"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "MULTI_REGION" 
  }

  labels = { owner = "pde" }
}
