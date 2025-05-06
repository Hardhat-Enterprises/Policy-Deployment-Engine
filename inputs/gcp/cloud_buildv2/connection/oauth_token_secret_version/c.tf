# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloudbuildv2_connection" "c" {
  name     = "connection-token-secure"
  location = "global"
  project =  "policy-deplo"
  disabled = false

  github_config {
    app_installation_id = "12345678"
    authorizer_credential {
      oauth_token_secret_version = "projects/demo/secrets/github-token/versions/1"  # ✅ Uses Secret Manager
    }
  }
}
