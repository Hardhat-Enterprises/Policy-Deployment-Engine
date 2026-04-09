# Google Dataform Repository — non-compliant git_required (missing default_branch)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = "reliable-alpha-478205-k9"
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"
  
  git_remote_settings {
    url             = "https://github.com/example/repo.git"
    default_branch  = ""  # Empty string - non-compliant for testing policy enforcement
    authentication_token_secret_version = "projects/example-project/secrets/git-token/versions/1"
  }
}
