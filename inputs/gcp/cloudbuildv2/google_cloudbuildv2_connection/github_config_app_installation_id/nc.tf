resource "google_cloudbuildv2_connection" "nc" {
  project  = "nc"
  location = "australia-southeast1"
  name     = "test-connection-nc"

  github_config {
    app_installation_id = 99999999
    authorizer_credential {
      oauth_token_secret_version = "projects/test/secrets/token/versions/1"
    }
  }
}