resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  gitlab_enterprise_config {
    host_uri                      = "https://gle.example.com"
    webhook_secret_secret_version = "projects/pde2025/secrets/gitlab-enterprise-webhook/versions/latest"
    read_authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/gitlab-enterprise-read-cred/versions/latest"
    }
    authorizer_credential {
      user_token_secret_version = "projects/pde2025/secrets/gitlab-enterprise-auth-cred/versions/latest"
    }
  }
}
