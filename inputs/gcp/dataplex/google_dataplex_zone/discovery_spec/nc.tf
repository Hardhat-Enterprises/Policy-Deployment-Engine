resource "google_dataplex_zone" "nc" {
  name     = "zone-noncompliant"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  type     = "RAW"

  discovery_spec {
    enabled = false
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }
}
