# Describe your resource type here

resource "google_discovery_engine_data_store" "nc" {
  project                     = "735927692082"
  location                    = "global"
  data_store_id               = "nc-data-store-id"
  display_name                = "tf-test-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "nc" {
  project           = "735927692082"
  engine_id         = "engine-id"
  collection_id     = "default_collection"
  location          = google_discovery_engine_data_store.nc.location
  display_name      = "tf-test-engine"
  data_store_ids    = [google_discovery_engine_data_store.nc.data_store_id]
  industry_vertical = "GENERIC"
  app_type          = "APP_TYPE_INTRANET"
  search_engine_config {
  }
}

resource "google_discovery_engine_control" "nc" {
  project       = "735927692082"
  location      = google_discovery_engine_search_engine.nc.location
  engine_id     = google_discovery_engine_search_engine.nc.engine_id
  control_id    = "nc"
  display_name  = "nc_control"
  solution_type = "SOLUTION_TYPE_SEARCH"
  use_cases     = ["SEARCH_USE_CASE_SEARCH"]

  #synonyms_action
  filter_action {
    filter     = "documentType = 'private'"
    data_store = google_discovery_engine_data_store.nc.data_store_id
  }
}