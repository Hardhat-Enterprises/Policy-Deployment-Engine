# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_data_store" "dnc" {
  project                     = "735927692082"
  location                    = "global"
  data_store_id               = "example-datastore-id"
  display_name                = "nc-test-structured-datastore"
  content_config              = "NO_CONTENT"
  industry_vertical           = "HEALTHCARE_FHIR"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "nc" {
  project           = "735927692082"
  engine_id         = "nc"
  collection_id     = "default_collection"
  location          = google_discovery_engine_data_store.dnc.location
  display_name      = "Display Name"
  data_store_ids    = [google_discovery_engine_data_store.dnc.data_store_id]
  industry_vertical = "HEALTHCARE_FHIR"

  search_engine_config {
  }
}
