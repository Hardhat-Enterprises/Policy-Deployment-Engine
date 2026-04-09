# Describe your resource type here
# engine_control_redirect


resource "google_discovery_engine_data_store" "c" {
project = "735927692082"
  location                    = "global"
  data_store_id               = "c-data-store-id"
  display_name                = "tf-test-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "c" {
project = "735927692082"
  engine_id                   = "engine-id"
  collection_id               = "default_collection"
  location                    = google_discovery_engine_data_store.c.location
  display_name                = "tf-test-engine"
  data_store_ids              = [google_discovery_engine_data_store.c.data_store_id]
  industry_vertical           = "GENERIC"
  app_type                    = "APP_TYPE_INTRANET"
  search_engine_config {
  }
}

resource "google_discovery_engine_control" "c" {
project = "735927692082"
  location       = google_discovery_engine_search_engine.c.location
  engine_id      = google_discovery_engine_search_engine.c.engine_id
  control_id     = "c"
  display_name   = "c-control"
  solution_type  = "SOLUTION_TYPE_SEARCH"
  use_cases      = ["SEARCH_USE_CASE_SEARCH"]

  #synonyms_action
  redirect_action {
    redirect_uri = "https://goodexample.com/special-landing-page"
  }
 }