

resource "google_dataplex_asset" "c" {
  name     = "asset-compliant"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  resource_spec {
    type = "STORAGE_BUCKET"
    name = "projects/my-project/buckets/my-secure-bucket"
  }

  discovery_spec {
    enabled = true
  }
}
