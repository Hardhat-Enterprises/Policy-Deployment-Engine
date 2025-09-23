resource "google_dataplex_asset" "nc" {
  name     = "asset-noncompliant"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  resource_spec {
    type = "INVALID_TYPE" 
    name = "projects/my-project/buckets/my-insecure-bucket"
  }

  discovery_spec {
    enabled = true
  }
}
