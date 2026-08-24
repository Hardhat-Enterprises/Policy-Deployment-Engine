# Discovery Engine assistant protected from accidental deletion.

resource "google_discovery_engine_assistant" "compliant_example_1" {
  project         = "735927692082"
  location        = "eu"
  collection_id   = "default_collection"
  engine_id       = "engine-id"
  assistant_id    = "compliant-assistant-1"
  display_name    = "Approved-region assistant"
  deletion_policy = "PREVENT"
}