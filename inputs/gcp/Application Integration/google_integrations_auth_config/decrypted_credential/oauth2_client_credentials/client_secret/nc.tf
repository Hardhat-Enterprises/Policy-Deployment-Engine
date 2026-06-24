resource "google_integrations_auth_config" "nc1" {
  location     = "us-central1"
  display_name = "nc1"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "OAUTH2_CLIENT_CREDENTIALS"

    oauth2_client_credentials {
      client_id      = "valid-client-id"
      client_secret  = ""
    }
  }
}

resource "google_integrations_auth_config" "nc2" {
  location     = "us-central1"
  display_name = "nc2"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "OAUTH2_CLIENT_CREDENTIALS"

    oauth2_client_credentials {
      client_id      = "valid-client-id"
    }
  }
}
