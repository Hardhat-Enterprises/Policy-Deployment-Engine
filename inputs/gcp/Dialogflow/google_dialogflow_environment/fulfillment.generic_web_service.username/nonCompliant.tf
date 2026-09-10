resource "google_dialogflow_environment" "non_compliant_example_1" {
  project = "my_gcp_project"
  environmentid = "basic-environment"
  description = "basic environment"
   fulfillment {
    generic_web_service {
      uri      = "https://example.com/webhook"
      username = "example-user"
    }
  }
}