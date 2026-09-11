resource "google_dialogflow_fulfillment" "compliant_example_1" {
  display_name = "basic-fulfillment"
  enabled    = true
  project = "my_gcp_project"
  generic_web_service {
    uri = "https://example.com/webhook"
  }
}