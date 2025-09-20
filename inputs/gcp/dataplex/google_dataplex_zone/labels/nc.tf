resource "google_dataplex_zone" "bad" {
  name     = "zone-bad"
  lake     = "test-lake"
  location = "us-central1"
  type     = "RAW"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }

  # owner label missing → should fail
  labels = {}
}
