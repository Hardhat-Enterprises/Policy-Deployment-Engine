# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link
# allow_cross_region is true

resource "google_discovery_engine_data_store" "nc" {
  display_name = "data_store_test1_c"
  data_store_id = "data-store"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  location = "eu"
  project = "735927692082"
  }

resource "google_discovery_engine_chat_engine" "nc" {
  engine_id = "chat-engine-id"
  collection_id ="default_collection"
  location = google_discovery_engine_data_store.c.location
  display_name = "Chat engine"
  data_store_ids = [google_discovery_engine_data_store.c.data_store_id]
  project = "735927692082"
    chat_engine_config {
    agent_creation_config {
    business = "test_business"
    default_language_code = "en"
    time_zone = "Australia/Sydney"
    }
    allow_cross_region = true
   }
}