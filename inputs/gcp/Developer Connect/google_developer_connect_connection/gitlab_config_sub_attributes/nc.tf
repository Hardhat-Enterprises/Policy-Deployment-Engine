resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  gitlab_config {
    webhook_secret_secret_version = "projects/otherproj/secrets/not-allowed/versions/2"
    read_authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/1"
    }
    authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/3"
    }
  }
}
