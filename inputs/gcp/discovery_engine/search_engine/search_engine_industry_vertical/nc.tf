# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_data_store" "nc" {
  project					  = "735927692082"
  location                    = "global"
  data_store_id               = "example-datastore-id"
  display_name                = "nc-test-structured-datastore"
  industry_vertical           = "HEALTHCARE_FHIR"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "nc" {
  project       = "735927692082"
  engine_id = "nc"
  collection_id = "default_collection"
  location = google_discovery_engine_data_store.nc.location
  display_name = "Display Name"
  data_store_ids = [google_discovery_engine_data_store.nc.data_store_id]
  search_engine_config {
  }
}
