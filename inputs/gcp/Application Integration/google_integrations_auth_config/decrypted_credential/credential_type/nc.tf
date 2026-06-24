resource "google_integrations_auth_config" "nc" {
  display_name = "nc"
  location     = "us-central1"
  project            = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "invalid_type"

  }
}

