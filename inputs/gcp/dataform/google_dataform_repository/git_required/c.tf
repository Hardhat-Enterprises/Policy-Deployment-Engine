# Google Dataform Repository — compliant (git_required: Git integration configured)

resource "google_dataform_repository" "c" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "c"
  
  git_remote_settings {
    url             = "https://github.com/company/repo.git"
    default_branch  = "main"
    authentication_token_secret_version = "projects/my-project/secrets/git-token/versions/1"
  }
}

