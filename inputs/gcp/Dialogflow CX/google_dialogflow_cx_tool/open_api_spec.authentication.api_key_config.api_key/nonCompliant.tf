resource "google_dialogflow_cx_tool" "non_compliant_example_1" {
  parent       = "projects/noncompliant-project/locations/global/agents/noncompliant-agent"
  display_name = "non-compliant-tool"
  description  = "Tool with an inline API key."

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
    authentication {
      api_key_config {
        key_name         = "X-Api-Key"
        request_location = "HEADER"
        api_key          = "plaintext-api-key"
      }
    }
  }
}
