resource "google_dialogflow_cx_tool" "non_compliant_example_1" {
  parent       = "projects/example-project/locations/global/agents/example-agent"
  display_name = "non_compliant_example_1"
  description  = "Dialogflow CX Tool fixture."

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
    authentication {
      api_key_config {
        key_name                   = "X-Api-Key"
        request_location           = "QUERY_STRING"
        secret_version_for_api_key = "projects/noncompliant-project/secrets/api-key/versions/1"
      }
    }
  }
}
