# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_integrations_auth_config" "compliant_example_1" {
  location     = "us-central1"
  display_name = "compliant_example_1"
  decrypted_credential {
    credential_type = "OAUTH2_CLIENT_CREDENTIALS"
    oauth2_client_credentials {
      client_id     = "demo-backend-client"
      client_secret = "demo-secret"
      scope         = "read"
      token_endpoint = "https://login-demo.example.com/oauth/v2/oauth-token"
      request_type  = "ENCODED_HEADER"
    }
  }
}