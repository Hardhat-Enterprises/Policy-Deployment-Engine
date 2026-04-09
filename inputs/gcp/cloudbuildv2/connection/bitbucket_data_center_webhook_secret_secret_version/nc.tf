resource "google_cloudbuildv2_connection" "nc" {
  project  = "my-project-nc"
  location = "us-central1"
  name     = "my-connection"

  bitbucket_data_center_config {
    host_uri                      = "https://bitbucket.example.com"
    webhook_secret_secret_version = "projects/my-project-nc/secrets/webhook-secret/versions/1"

    read_authorizer_credential {
      user_token_secret_version = "projects/my-project-nc/secrets/read-token/versions/1"
    }

    authorizer_credential {
      user_token_secret_version = "projects/my-project-nc/secrets/admin-token/versions/1"
    }
  }
}