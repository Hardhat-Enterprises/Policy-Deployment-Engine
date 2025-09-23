

resource "google_dataplex_asset" "c" {
  name     = "asset-json-ok"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  discovery_spec {
    enabled = true
    json_options {
      encoding      = "UTF-8"
      disable_type_inference = false
    }
  }

  resource_spec {
    type = "STORAGE_BUCKET"
    name = "projects/my-project/buckets/json-ok"
  }
}
