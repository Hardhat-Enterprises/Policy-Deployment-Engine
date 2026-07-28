# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_search_engine" "compliant_example_1" {
  project           = "735927692082"
  engine_id         = "compliant_example_1"
  collection_id     = "default_collection"
  location          = "eu"
  display_name      = "Display Name"
  data_store_ids    = ["example-datastore-id"]
  industry_vertical = "GENERIC"

  search_engine_config {
  }
}
