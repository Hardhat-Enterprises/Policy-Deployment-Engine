resource "google_dataplex_asset" "c" {
  name              = "asset"
  location          = "us-west1"
  project           = "my-project-name"
  deletion_policy   = "PREVENT"

  lake          = "google_dataplex_lake.basic_lake.name"
  dataplex_zone = "google_dataplex_zone.basic_zone.name"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    name = "projects/my-project-name/buckets/bucket"
    type = "STORAGE_BUCKET"
  }
}