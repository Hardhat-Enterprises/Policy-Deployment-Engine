# Banned phrases use word-boundary matching.

resource "google_discovery_engine_assistant" "compliant_example_1" {
  project            = "735927692082"
  location           = "eu"
  collection_id      = "default_collection"
  engine_id          = "engine-id"
  assistant_id       = "assistant-id"
  display_name       = "Word-boundary matching assistant"
  deletion_policy    = "PREVENT"
  web_grounding_type = "WEB_GROUNDING_TYPE_DISABLED"

  customer_policy {
    banned_phrases {
      phrase            = "prohibited-content"
      match_type        = "WORD_BOUNDARY_STRING_MATCH"
      ignore_diacritics = true
    }
  }
}