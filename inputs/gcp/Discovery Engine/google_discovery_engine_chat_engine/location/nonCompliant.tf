resource "google_discovery_engine_chat_engine" "non_compliant_example_1" {
  engine_id = "non_compliant_example_1"
  collection_id ="default_collection"
  location = "us-East3"
  display_name = "Chat engine"
  data_store_ids = [google_discovery_engine_data_store.c.data_store_id]
  project = "735927692082"
    chat_engine_config {
    agent_creation_config {
    business = "test_business"
    default_language_code = "en"
    time_zone = "Australia/Sydney"
    location = "us-East3"
    }
    allow_cross_region = false
   }
}

