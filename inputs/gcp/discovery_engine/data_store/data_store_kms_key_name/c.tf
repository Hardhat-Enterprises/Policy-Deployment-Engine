
# data_store_kms_key_name

resource "google_discovery_engine_data_store" "c" {
project = "735927692082"
  location                    = "us"
  data_store_id               = "c"
  display_name                = "tf-test-structured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  kms_key_name                = "/project/keys/my-safe-key"
  create_advanced_site_search = false
}


