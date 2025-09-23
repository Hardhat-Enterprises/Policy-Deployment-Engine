

resource "google_dataplex_asset" "c" {
  name     = "asset-label-ok"
  project  = var.project
  location = "us-central1"
  lake     = "example-lake"
  dataplex_zone = "zone-compliant"

  labels = {
    environment = "prod"
    owner       = "security-team"
  }

  discovery_spec {
    enabled = true
  }

  resource_spec {
    type = "STORAGE_BUCKET"
    name = "projects/my-project/buckets/asset-label-ok"
  }
}
