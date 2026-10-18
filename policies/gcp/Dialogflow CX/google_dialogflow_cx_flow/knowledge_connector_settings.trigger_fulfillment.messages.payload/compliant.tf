resource "google_dialogflow_cx_flow" "compliant_example_1" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "compliant_example_1"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      messages {
        payload = jsonencode({
          message = "Request completed successfully"
          status  = "success"
        })
      }
    }
  }
}
