# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_search_engine" "non_compliant_example_1" {
  project           = "735927692082"
  engine_id         = "non_compliant_example_1"
  collection_id     = "default_collection"
  location          = "eu"
  display_name      = "Display Name"
  data_store_ids    = ["example-datastore-id"]
  industry_vertical = "HEALTHCARE_FHIR"

  search_engine_config {
  }
}
