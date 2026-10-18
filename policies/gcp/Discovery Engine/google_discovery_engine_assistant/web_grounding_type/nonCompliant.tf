# Discovery Engine assistant using an unapproved external grounding source.

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project            = "735927692082"
  location           = "eu"
  collection_id      = "default_collection"
  engine_id          = "engine-id"
  assistant_id       = "non_compliant_example_1"
  display_name       = "Secure grounding assistant"
  deletion_policy    = "PREVENT"
  web_grounding_type = "WEB_GROUNDING_TYPE_GOOGLE_SEARCH"
}
