resource "google_dataplex_asset" "non_compliant_example_1" {

  name            = "non_compliant_example_1"
  location        = "australia-southeast1"
  project         = "my-project-name"
  deletion_policy = "PREVENT"

  lake          = "google_dataplex_lake.basic_lake.name"
  dataplex_zone = "google_dataplex_zone.basic_zone.name"

  discovery_spec {
    enabled = false
  }

  resource_spec {
    name = "projects/my-project-name/buckets/bucket"
    type = "STORAGE_BUCKET"
  }
}