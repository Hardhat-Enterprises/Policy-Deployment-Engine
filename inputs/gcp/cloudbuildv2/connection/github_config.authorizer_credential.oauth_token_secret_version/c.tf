resource "google_cloudbuildv2_connection" "c" {
  project  = "my-project-c"
  location = "australia-southeast2"
  name     = "my-connection"

  github_config {
    app_installation_id = 300

    authorizer_credential {
      oauth_token_secret_version = "projects/my-project-c/secrets/oauth-token/versions/1"
    }
  }
}