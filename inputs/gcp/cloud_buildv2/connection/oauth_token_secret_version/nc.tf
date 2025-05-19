resource "google_cloudbuildv2_connection" "nc" {
  name     = "insecure-secret-version"
  location = "global"
  project  = "policy-deplo"
  disabled = false

  github_config {
    app_installation_id = 12345678
    authorizer_credential {
      oauth_token_secret_version = "projects/demo/secrets/wrong-token/versions/abc"
    }
  }
}
