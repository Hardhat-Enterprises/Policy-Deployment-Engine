# Google Dataform Repository — non-compliant (git_ssh_auth: SSH authentication missing)

resource "google_dataform_repository" "nc" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "nc"
  
  git_remote_settings {
    url            = "git@github.com:company/repo.git"
    default_branch = "main"
  }
}

