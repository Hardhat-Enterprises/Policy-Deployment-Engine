# Discovery Engine assistant that permits deletion.

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project         = "735927692082"
  location        = "eu"
  collection_id   = "default_collection"
  engine_id       = "engine-id"
  assistant_id    = "non-compliant-assistant-1"
  display_name    = "Unapproved-region assistant"
  deletion_policy = "DELETE"
}