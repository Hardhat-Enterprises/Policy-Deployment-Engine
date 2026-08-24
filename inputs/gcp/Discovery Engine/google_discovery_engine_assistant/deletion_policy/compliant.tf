# Discovery Engine assistant deployed in an approved location.

resource "google_discovery_engine_assistant" "compliant_example_1" {
  project         = "735927692082"
  location        = "eu"
  collection_id   = "default_collection"
  engine_id       = "engine-id"
  assistant_id    = "assistant-id"
  display_name    = "Approved-region assistant"
  deletion_policy = "PREVENT"
}