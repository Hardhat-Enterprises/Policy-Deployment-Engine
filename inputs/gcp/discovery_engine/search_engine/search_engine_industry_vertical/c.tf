# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_data_store" "dc" {
  project                     = "735927692082"
  location                    = "eu"
  data_store_id               = "example-datastore-id"
  display_name                = "c-test-structured-datastore"
  content_config              = "NO_CONTENT"
  industry_vertical           = "GENERIC"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "c" {
  project           = "735927692082"
  engine_id         = "c"
  collection_id     = "default_collection"
  location          = google_discovery_engine_data_store.dc.location
  display_name      = "Display Name"
  data_store_ids    = [google_discovery_engine_data_store.dc.data_store_id]
  industry_vertical = "GENERIC"

  search_engine_config {
  }
}
