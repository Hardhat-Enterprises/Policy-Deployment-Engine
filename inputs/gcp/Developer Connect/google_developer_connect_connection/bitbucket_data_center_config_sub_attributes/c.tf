resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  bitbucket_data_center_config {
    host_uri                      = "https://bitbucket.example.com"
    webhook_secret_secret_version = "projects/pde2025/secrets/bbdc-webhook/versions/latest"
    read_authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/bbdc-read-cred/versions/latest"
    }
    authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/bbdc-auth-cred/versions/latest"
    }
  }
}
