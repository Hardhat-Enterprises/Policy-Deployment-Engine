resource "google_dialogflow_cx_tool" "non_compliant_example_1" {
  parent       = "projects/noncompliant-project/locations/global/agents/noncompliant-agent"
  display_name = "non-compliant-tool"
  description  = "Tool exchanging OAuth credentials over HTTP."

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
    authentication {
      oauth_config {
        client_id                        = "example-client-id"
        oauth_grant_type                 = "CLIENT_CREDENTIAL"
        secret_version_for_client_secret = "projects/noncompliant-project/secrets/client-secret/versions/1"
        token_endpoint                   = "http://oauth.example.com/token"
      }
    }
  }
}
