
resource "google_discovery_engine_data_store" "c" {

  location                     = "eu"
  data_store_id                = "c"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "CONTENT_REQUIRED"
  solution_types               = ["SOLUTION_TYPE_SEARCH"]
  kms_key_name                 = "kms-key"
  create_advanced_site_search  = false
  skip_default_schema_creation = false

  project = "735927692082"

}
