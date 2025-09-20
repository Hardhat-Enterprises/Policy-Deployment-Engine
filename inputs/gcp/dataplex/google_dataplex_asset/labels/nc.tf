resource "google_dataplex_asset" "bad" {
  name          = "asset-bad"
  project       = "dummy-project"  
  lake          = "test-lake"
  dataplex_zone = "zone-ok"
  location      = "us-central1"

  resource_spec {
    name = "projects/dummy-project/buckets/noncompliant-bucket"
    type = "STORAGE_BUCKET"
  }

  discovery_spec {
    enabled = true
  }

}
