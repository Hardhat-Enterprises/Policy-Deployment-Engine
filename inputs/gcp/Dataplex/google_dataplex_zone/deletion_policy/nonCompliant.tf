resource "google_dataplex_zone" "non_compliant_example_1" {
  
  project = "non_compliant_example_1"

  discovery_spec {
    enabled = false
  }

  lake     = "google_dataplex_lake.basic.name"
  location = "us-west1"
  name     = "non_compliant_example_1"

  resource_spec {
    location_type = "MULTI_REGION"
  }

  type              = "RAW"
  deletion_policy   = "DELETE"
}

