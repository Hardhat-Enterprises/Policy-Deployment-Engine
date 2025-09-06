# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# data_store_location

resource "google_discovery_engine_data_store" "c" {
project = "735927692082"
  location                     = "eu"
  data_store_id                = "c"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "NO_CONTENT"
  solution_types               = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search  = false
  skip_default_schema_creation = false
}


