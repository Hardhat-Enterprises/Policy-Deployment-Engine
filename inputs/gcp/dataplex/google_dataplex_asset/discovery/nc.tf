resource "google_dataplex_asset" "nc" {
  name     = "asset-noncompliant"
  project  = "my-project"
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-1"


  discovery_spec {
    enabled = false
  }

  resource_spec {
    name = "projects/my-project/buckets/insecure-bucket"
    type = "STORAGE_BUCKET"
  }
}
