resource "google_integrations_auth_config" "nc" {
  location     = "us-central1"
  display_name = "nc"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "OAUTH2_CLIENT_CREDENTIALS"

    oauth2_client_credentials {
      client_id      = "valid-client-id"
      client_secret  = "mysecret"
      request_type   = "QUERY_PARAMETERS"
      scope          = "read"
    }
  }
}
