resource "google_dialogflow_cx_webhook" "compliant_example_1" {
  parent       = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name = "compliant_example_1"

  generic_web_service {
    uri = "https://example.com/webhook"
  }
}
