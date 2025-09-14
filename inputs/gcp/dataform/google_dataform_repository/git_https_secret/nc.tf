# Google Dataform Repository — non-compliant git_https_secret (HTTPS auth secret format)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "git-https-non-compliant"
  display_name   = "nc"
  
  git_remote_settings {
    url                                   = "https://github.com/example/repo.git"
    default_branch                        = "main"
    authentication_token_secret_version   = ""
  }
}

