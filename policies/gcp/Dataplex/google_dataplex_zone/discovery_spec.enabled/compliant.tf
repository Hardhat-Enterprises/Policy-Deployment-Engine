resource "google_dataplex_zone" "compliant_example_1" {
  project = "my-project-name"

  discovery_spec {
    enabled = true
  }

  lake     = "lake"
  location = "australia-southeast1"
  name     = "compliant_example_1"

  resource_spec {
    location_type = "MULTI_REGION"
  }

  type = "RAW"
}