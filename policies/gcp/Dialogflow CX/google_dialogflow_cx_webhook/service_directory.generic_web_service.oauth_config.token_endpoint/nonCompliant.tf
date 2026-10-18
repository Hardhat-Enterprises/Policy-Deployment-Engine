resource "google_dialogflow_cx_webhook" "non_compliant_example_1" {
  parent       = "projects/example-project/locations/us-central1/agents/00000000-0000-0000-0000-000000000000"
  display_name = "non_compliant_example_1"

  service_directory {
    service = "projects/example-project/locations/us-central1/namespaces/example-namespace/services/example-service"

    generic_web_service {
      uri = "https://example.internal/webhook"

      oauth_config {
        client_id                        = "example-client"
        secret_version_for_client_secret = "projects/example-project/secrets/oauth-client-secret/versions/1"
        token_endpoint                   = "http://identity.example.com/oauth/token"
        scopes                           = ["orders.read"]
      }
    }
  }
}
