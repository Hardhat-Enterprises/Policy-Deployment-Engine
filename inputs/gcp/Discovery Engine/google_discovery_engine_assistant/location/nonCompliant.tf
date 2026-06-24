# Describe your resource type here

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project = "735927692082"
  location                      = "us"
  collection_id                 = "default_collection"
  engine_id                     = "example-engine-id"
  assistant_id                  = "non_compliant_example_1"
  display_name                  = "updated-tf-test-Assistant"
  description                   = "Assistant Description"
  generation_config {
    system_instruction {
      additional_system_instruction = "foobar"
    }
    default_language            = "en"
  }
  customer_policy {
    banned_phrases {
      phrase                    = "foo"
      match_type                = "SIMPLE_STRING_MATCH"
      ignore_diacritics         = false
    }
  }
  web_grounding_type            = "WEB_GROUNDING_TYPE_GOOGLE_SEARCH"
}
