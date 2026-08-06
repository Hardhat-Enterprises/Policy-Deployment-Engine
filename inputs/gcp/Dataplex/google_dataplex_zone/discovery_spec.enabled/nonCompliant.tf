resource "google_dataplex_zone" "non_compliant_example_1" {
  project = "my-project-name"

  discovery_spec {
    enabled = false
  }

  lake     = "lake"
  location = "australia-southeast1"
  name     = "non_compliant_example_1"

  resource_spec {
    location_type = "MULTI_REGION"
  }

  type = "RAW"
}