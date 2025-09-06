
#data_store_kms_key_name

resource "google_discovery_engine_data_store" "nc" {
project = "735927692082"
  location                    = "us"
  data_store_id               = "nc"
  display_name                = "tf-test-risky-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

#Key is ommited, so default is used.
#Use Blacklist "" to ensure that a null answer is not premitted, or whitelist the proper key.

