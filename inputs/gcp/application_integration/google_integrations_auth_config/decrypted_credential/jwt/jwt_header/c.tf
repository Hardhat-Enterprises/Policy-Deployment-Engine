resource "google_integrations_auth_config" "c" {
  location     = "us-central1"
  display_name = "c"
  project      = "your-gcp-project-id"
  

  decrypted_credential {
    credential_type = "JWT"

    jwt {
      jwt_header  = "{\"alg\": \"HS256\", \"typ\": \"JWT\"}"
      
    }
  }
}
