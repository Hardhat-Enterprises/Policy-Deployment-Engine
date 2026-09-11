resource "google_dataplex_zone" "compliant_example_1" {

    project = "compliant_example_1"

  discovery_spec {
    enabled = false
  }

  lake     = "google_dataplex_lake.basic.name"
  location = "australia-southeast1"
  name     = "compliant_example_1"

  resource_spec {
    location_type = "MULTI_REGION"
  }

  type              = "RAW"
  deletion_policy   = "PREVENT" 
}
