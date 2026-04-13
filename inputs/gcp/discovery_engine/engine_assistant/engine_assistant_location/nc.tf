# Describe your resource type here

resource "google_discovery_engine_data_store" "nc" {
  project                     = "735927692082"
  location                    = "eu"
  data_store_id               = "example-data-store-id"
  display_name                = "tf-test-structured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false
}

resource "google_discovery_engine_search_engine" "nc" {
  project        = "735927692082"
  location       = "eu"
  collection_id  = "default_collection"
  engine_id      = "example-engine-id"
  display_name   = "Example Display Name"
  data_store_ids = [google_discovery_engine_data_store.nc.data_store_id]
  search_engine_config {
  }
}
resource "google_discovery_engine_assistant" "nc" {
  project       = "735927692082"
  location      = "us"
  collection_id = "default_collection"
  engine_id     = google_discovery_engine_search_engine.nc.engine_id
  assistant_id  = "nc"
  display_name  = "updated-tf-test-Assistant"
  description   = "Assistant Description"
  generation_config {
    system_instruction {
      additional_system_instruction = "foobar"
    }
    default_language = "en"
  }
  customer_policy {
    banned_phrases {
      phrase            = "foo"
      match_type        = "SIMPLE_STRING_MATCH"
      ignore_diacritics = false
    }
  }
  web_grounding_type = "WEB_GROUNDING_TYPE_GOOGLE_SEARCH"
}