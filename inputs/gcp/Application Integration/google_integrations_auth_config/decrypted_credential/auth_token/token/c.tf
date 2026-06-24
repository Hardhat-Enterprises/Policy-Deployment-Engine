resource "google_integrations_auth_config" "c" {
  location     = "us-central1"
  display_name = "c"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "AUTH_TOKEN"
    auth_token {
      type  = "Bearer"
      token = "secure-token-value"
    }
  }
}