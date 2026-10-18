resource "google_dialogflow_cx_tool_version" "non_compliant_example_1" {
  parent       = "projects/test-project/locations/global/agents/test-agent/tools/test-tool"
  display_name = "non-compliant-example-1"

  tool {
    display_name = "example-tool"
    description  = "Example tool"

    open_api_spec {
      authentication {
        api_key_config {
          key_name                   = "X-Api-Key"
          request_location           = "QUERY_STRING"
          secret_version_for_api_key = "projects/test-project/secrets/example-api-key/versions/1"
        }
      }

      text_schema = <<EOF
{
  "openapi": "3.0.0",
  "info": {
    "title": "Example API",
    "version": "1.0.0"
  },
  "paths": {}
}
EOF
    }
  }
}