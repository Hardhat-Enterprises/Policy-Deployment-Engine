# Google Dataform Repository — compliant git_required (URL + default_branch required)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "git-required-compliant"
  display_name   = "c"
  
  git_remote_settings {
    url            = "https://github.com/example/repo.git"
    default_branch = "main"
    authentication_token_secret_version = "projects/EX/secrets/git-token/versions/1"
  }
}

