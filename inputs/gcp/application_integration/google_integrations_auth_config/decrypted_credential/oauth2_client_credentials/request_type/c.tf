resource "google_integrations_auth_config" "c" {
  location     = "us-central1"
  display_name = "c"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "OAUTH2_CLIENT_CREDENTIALS"

    oauth2_client_credentials {
      client_id      = "valid-client-id"
      client_secret  = "mysecret"
      request_type   = "ENCODED_HEADER"
    }
  }
}