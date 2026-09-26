resource "google_dialogflow_cx_tool" "compliant_example_1" {
  parent       = "projects/example-project/locations/global/agents/example-agent"
  display_name = "compliant_example_1"
  description  = "Dialogflow CX Tool fixture."

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
    authentication {
      bearer_token_config {
        secret_version_for_token = "projects/compliant-project/secrets/bearer-token/versions/1"
      }
    }
  }
}
