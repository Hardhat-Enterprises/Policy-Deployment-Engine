resource "google_dialogflow_cx_flow" "non_compliant_example_1" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "non_compliant_example_1"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      advanced_settings {
        logging_settings {
          enable_consent_based_redaction = true
          enable_interaction_logging     = true
          enable_stackdriver_logging     = false
        }
      }
    }
  }
}
