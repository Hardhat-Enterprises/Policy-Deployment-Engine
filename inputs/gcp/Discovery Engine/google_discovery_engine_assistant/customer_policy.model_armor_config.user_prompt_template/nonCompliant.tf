# User prompts use an unapproved Model Armor template.

resource "google_discovery_engine_assistant" "non_compliant_example_1" {
  project            = "735927692082"
  location           = "eu"
  collection_id      = "default_collection"
  engine_id          = "engine-id"
  assistant_id       = "non_compliant_example_1"
  display_name       = "Protected prompt assistant"
  deletion_policy    = "PREVENT"
  web_grounding_type = "WEB_GROUNDING_TYPE_DISABLED"

  customer_policy {
    model_armor_config {
      failure_mode         = "FAIL_CLOSED"
      response_template    = "projects/735927692082/locations/eu/templates/approved-response-template"
      user_prompt_template = "projects/735927692082/locations/eu/templates/unapproved-prompt-template"
    }
  }
}
