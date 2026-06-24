resource "google_integrations_auth_config" "c" {
  display_name = "c"
  location     = "us-central1"
  project            = "your-gcp-project-id"

  decrypted_credential {
    credential_type = "service_account_credentials"

  }
}

