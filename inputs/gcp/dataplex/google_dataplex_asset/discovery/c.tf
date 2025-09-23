resource "google_dataplex_asset" "c" {
  name     = "asset-compliant"
  project  = "my-project"
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-1"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    name = "projects/my-project/buckets/my-secure-bucket"
    type = "STORAGE_BUCKET"
  }
}
