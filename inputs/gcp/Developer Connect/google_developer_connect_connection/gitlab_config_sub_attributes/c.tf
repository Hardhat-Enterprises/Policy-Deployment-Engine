resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  gitlab_config {
    webhook_secret_secret_version = "projects/pde2025/secrets/gitlab-webhook/versions/latest"
    read_authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/gitlab-read-cred/versions/latest"
    }
    authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/gitlab-auth-cred/versions/latest"
    }
  }
}
