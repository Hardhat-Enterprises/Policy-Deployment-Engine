resource "google_integrations_auth_config" "nc" {
  location     = "us-central1"
  display_name = "nc"
  project      = "your-gcp-project-id"
  

  decrypted_credential {
    credential_type = "JWT"

    jwt {
      jwt_header  = "{\"alg\": \"RS256\", \"typ\": \"JWT\"}"
      
    }
  }
}
