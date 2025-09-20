resource "google_dataplex_asset" "ok" {
  name          = "asset-ok"
  project       = "dummy-project"
  lake          = "test-lake"
  dataplex_zone = "zone-ok"
  location      = "us-central1"

  resource_spec {
    name = "projects/dummy-project/buckets/compliant-bucket"
    type = "STORAGE_BUCKET"
  }

  discovery_spec {
    enabled = true

    json_options {
      disable_type_inference = false
    }
  }

  labels = {
    owner = "pde"
  }
}
