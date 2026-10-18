resource "google_dialogflow_cx_webhook" "non_compliant_example_1" {
  parent          = "projects/example-project/locations/global/agents/00000000-0000-0000-0000-000000000000"
  display_name    = "non_compliant_example_1"
  deletion_policy = "DELETE"

  generic_web_service {
    uri = "https://example.com/webhook"
  }
}
