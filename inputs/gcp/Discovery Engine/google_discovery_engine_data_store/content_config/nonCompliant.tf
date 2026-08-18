resource "google_discovery_engine_data_store" "non_compliant_example_1" {

  location                     = "eu"
  data_store_id                = "non_compliant_example_1"
  display_name                 = "tf-test-structured-datastore"
  industry_vertical            = "GENERIC"
  content_config               = "PUBLIC_WEBSITE"
  solution_types               = ["SOLUTION_TYPE_SEARCH"]
  kms_key_name                 = "kms-key"
  create_advanced_site_search  = false
  skip_default_schema_creation = false

  project = "735927692082"

}
