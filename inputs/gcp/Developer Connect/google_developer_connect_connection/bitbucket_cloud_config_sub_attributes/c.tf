resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  bitbucket_cloud_config {
    workspace                     = "proctor-test"
    webhook_secret_secret_version = "projects/pde2025/secrets/bbc-webhook/versions/latest"
    read_authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/bbc-read-cred/versions/latest"
    }
    authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/bbc-auth-cred/versions/latest"
    }
  }
}
