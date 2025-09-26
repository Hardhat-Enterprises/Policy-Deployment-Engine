resource "google_integrations_auth_config" "nc" {
  location     = "us-central1"
  display_name = "nc"
  project      = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "AUTH_TOKEN"
    auth_token {
      type  = "BASIC" #Insecure type
      token = "some-token"
    }
  }
}