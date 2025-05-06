# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_connection" "nc" {
  name     = "disabled-test-false"
  location = "global"
  project = "policy-deplo"
  disabled = true

  github_config {
    app_installation_id = "12345678"
    authorizer_credential {
      oauth_token_secret_version = "projects/demo/secrets/github-token/versions/1"
    }
  }
}
