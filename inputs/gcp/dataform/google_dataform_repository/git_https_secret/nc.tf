# Google Dataform Repository — non-compliant (git_https_secret: Invalid Secret Manager format)

resource "google_dataform_repository" "nc" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "nc"
  
  git_remote_settings {
    url                                = "https://github.com/company/repo.git"
    default_branch                     = "main"
    authentication_token_secret_version = "invalid-secret-format"
  }
}


