# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_connection" "nc" {
  name     = "connection-installation-id-bad"
  location = "global"
  project = "policy-deplo"
  disabled = true 

  github_config {
    app_installation_id = 0  
    authorizer_credential {
      oauth_token_secret_version = "projects/demo/secrets/github-token/versions/1"
    }
  }
}
#   # Optional attributes
