resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  gitlab_enterprise_config {
    host_uri                      = "http://gle.example.com"
    webhook_secret_secret_version = "projects/otherproj/secrets/not-allowed/versions/7"
    read_authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/8"
    }
    authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/9"
    }
  }
}
