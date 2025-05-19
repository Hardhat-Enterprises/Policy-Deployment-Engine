resource "google_cloudbuildv2_connection" "nc" {
  name     = "insecure-installation-id"
  location = "global"
  project  = "policy-deplo"
  disabled = false

  github_config {
    app_installation_id = 0
    authorizer_credential {
      oauth_token_secret_version = "projects/demo/secrets/github-token/versions/1"
    }
  }
}
