resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  bitbucket_data_center_config {
    host_uri                      = "http://bitbucket.example.com"
    webhook_secret_secret_version = "projects/otherproj/secrets/not-allowed/versions/6"
    read_authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/7"
    }
    authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/8"
    }
  }
}
