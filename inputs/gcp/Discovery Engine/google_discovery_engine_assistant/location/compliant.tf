# Discovery Engine assistant protected from accidental deletion.

resource "google_discovery_engine_assistant" "compliant_example_1" {
  project         = "735927692082"
  location        = "global"
  collection_id   = "default_collection"
  engine_id       = "engine-id"
  assistant_id    = "assistant-id"
  display_name    = "Protected assistant"
  deletion_policy = "PREVENT"
}