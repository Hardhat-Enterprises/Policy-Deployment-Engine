# Google Dataform Repository — non-compliant git_https_secret (HTTPS token missing)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"
  
  git_remote_settings {
    url             = "https://github.com/example/repo.git"
    default_branch  = "main"
    # Fixed: added HTTPS token secret and removed SSH authentication
    authentication_token_secret_version = "projects/${var.project}/secrets/git-https-token/versions/1"
    # ssh_authentication_config removed - using HTTPS token authentication instead
  }
}
