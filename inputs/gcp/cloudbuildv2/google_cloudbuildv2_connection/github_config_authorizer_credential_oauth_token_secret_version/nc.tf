resource "google_cloudbuildv2_connection" "nc" {
  project  = "nc"
  location = "us-central1"
  name     = "my-connection"

  github_config {
    app_installation_id = 300

    authorizer_credential {
      oauth_token_secret_version = "projects/my-project-nc/secrets/oauth-token/versions/1"
    }
  }
}