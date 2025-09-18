# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_data_store" "c" {
  project					  = "735927692082"
  location                    = "global"
  data_store_id               = "example-datastore-id"
  display_name                = "c-test-structured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "c" {
  project       = "735927692082"
  engine_id = "c"
  collection_id = "default_collection"
  location = google_discovery_engine_data_store.c.location
  display_name = "Display Name"
  data_store_ids = [google_discovery_engine_data_store.c.data_store_id]
  search_engine_config {
  }
}
