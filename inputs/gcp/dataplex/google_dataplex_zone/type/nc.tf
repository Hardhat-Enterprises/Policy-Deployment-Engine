resource "google_dataplex_zone" "bad" {
  project  = "dummy-project"
  name     = "zone-type-bad"
  lake     = "test-lake"
  location = "us-central1"
  type     = "INVALID" 

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }

  labels = { owner = "pde" }
}
