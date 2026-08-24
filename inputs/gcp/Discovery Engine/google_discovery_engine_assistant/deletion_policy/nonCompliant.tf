# Discovery Engine assistant deployed outside the approved location.

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project         = "735927692082"
  location        = "global"
  collection_id   = "default_collection"
  engine_id       = "engine-id"
  assistant_id    = "assistant-id"
  display_name    = "Unapproved-region assistant"
  deletion_policy = "PREVENT"
}