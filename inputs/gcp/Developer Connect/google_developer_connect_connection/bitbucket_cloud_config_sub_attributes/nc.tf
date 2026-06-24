resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  bitbucket_cloud_config {
    workspace                     = "evil-workspace"
    webhook_secret_secret_version = "projects/otherproj/secrets/not-allowed/versions/1"
    read_authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/2"
    }
    authorizer_credential {
      user_token_secret_version = "projects/otherproj/secrets/not-allowed/versions/3"
    }
  }
}
