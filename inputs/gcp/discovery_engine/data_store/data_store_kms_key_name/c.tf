# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# data_store_kms_key_name

resource "google_discovery_engine_data_store" "c" {
  location                    = "us"
  data_store_id               = "c-data-store-keyname"
  display_name                = "tf-test-structured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  kms_key_name                = "/project/keys/my-safe-key"
  create_advanced_site_search = false
}


