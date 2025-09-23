resource "google_dataplex_zone" "nc" {
  name     = "zone-noncompliant"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  type     = "INVALID_TYPE" 

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }
}
