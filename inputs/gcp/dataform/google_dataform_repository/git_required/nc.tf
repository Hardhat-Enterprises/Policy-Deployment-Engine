# Google Dataform Repository — non-compliant git_required (URL + default_branch required)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "git-required-non-compliant"
  display_name   = "nc"
  
  git_remote_settings {
    url            = "https://github.com/example/repo.git"
    default_branch = ""
    authentication_token_secret_version = "projects/EX/secrets/git-token/versions/1"
  }
}

