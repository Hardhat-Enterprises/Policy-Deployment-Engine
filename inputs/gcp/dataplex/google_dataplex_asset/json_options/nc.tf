resource "google_dataplex_asset" "nc" {
  name     = "asset-json-bad"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  discovery_spec {
    enabled = true
    json_options {
      encoding      = "ASCII"
      disable_type_inference = true
    }
  }

  resource_spec {
    type = "STORAGE_BUCKET"
    name = "projects/my-project/buckets/json-bad"
  }
}
