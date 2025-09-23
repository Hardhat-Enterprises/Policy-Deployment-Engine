resource "google_dataplex_asset" "nc" {
  name     = "asset-label-bad"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    type = "STORAGE_BUCKET"
    name = "projects/my-project/buckets/asset-label-bad"
  }


}
