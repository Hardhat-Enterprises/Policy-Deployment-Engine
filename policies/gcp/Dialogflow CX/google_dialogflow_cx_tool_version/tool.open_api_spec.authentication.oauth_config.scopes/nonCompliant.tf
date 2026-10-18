resource "google_dialogflow_cx_tool_version" "non_compliant_example_1" {
  parent       = "projects/test-project/locations/global/agents/test-agent/tools/test-tool"
  display_name = "non-compliant-example-1"

  tool {
    display_name = "example-tool"
    description  = "Example tool"

    open_api_spec {
      authentication {
        oauth_config {
          oauth_grant_type = "CLIENT_CREDENTIAL"
          client_id        = "example-client-id"
          token_endpoint   = "https://example.com/oauth/token"

          scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
          ]
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