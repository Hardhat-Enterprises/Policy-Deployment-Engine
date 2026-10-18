resource "google_discovery_engine_chat_engine" "non_compliant_example_1" {
  engine_id = "non_compliant_example_1"
  collection_id ="default_collection"
  location = "us-East3"
  display_name = "Chat engine"
  data_store_ids = ["data-store"]
  project = "735927692082"
    chat_engine_config {
    agent_creation_config {
    business = "test_business"
    default_language_code = "en"
    location = "eu"
    time_zone = "Australia/Sydney"
    }
    allow_cross_region = false
   }
}

