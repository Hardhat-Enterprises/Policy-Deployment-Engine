# Model Armor fails open when sanitization cannot be completed.

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project            = "735927692082"
  location           = "eu"
  collection_id      = "default_collection"
  engine_id          = "engine-id"
  assistant_id       = "non_compliant_example_1"
  display_name       = "Fail-closed assistant"
  deletion_policy    = "PREVENT"
  web_grounding_type = "WEB_GROUNDING_TYPE_DISABLED"

  customer_policy {
    model_armor_config {
      failure_mode         = "FAIL_OPEN"
      response_template    = "projects/735927692082/locations/eu/templates/approved-response-template"
      user_prompt_template = "projects/735927692082/locations/eu/templates/approved-prompt-template"
    }
  }
}
