
# data_store_location

resource "google_discovery_engine_data_store" "nc" {
project = "735927692082"
  location                     = "global"
  data_store_id                = "nc"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"
  solution_types               = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search  = false
  skip_default_schema_creation = false
}

