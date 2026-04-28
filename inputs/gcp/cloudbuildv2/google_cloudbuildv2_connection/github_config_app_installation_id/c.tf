resource "google_cloudbuildv2_connection" "c" {
  project  = "c"
  location = "australia-southeast1"
  name     = "test-connection-c"

  github_config {
    app_installation_id = 12345678
    authorizer_credential {
      oauth_token_secret_version = "projects/test/secrets/token/versions/1"
    }
  }
}