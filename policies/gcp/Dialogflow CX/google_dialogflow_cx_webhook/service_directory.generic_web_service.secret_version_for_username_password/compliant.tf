resource "google_dialogflow_cx_webhook" "compliant_example_1" {
  parent       = "projects/example-project/locations/us-central1/agents/00000000-0000-0000-0000-000000000000"
  display_name = "compliant_example_1"

  service_directory {
    service = "projects/example-project/locations/us-central1/namespaces/example-namespace/services/example-service"

    generic_web_service {
      uri                = "https://example.internal/webhook"
      service_agent_auth = "ID_TOKEN"
    }
  }
}
