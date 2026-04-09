# Google Dataform Repository — compliant git_required (both URL and default_branch set)

resource "google_dataform_repository" "c" {
  provider     = google-beta
  project      = "reliable-alpha-478205-k9"
  region       = "australia-southeast1"
  name         = "c"
  display_name = "c"

  git_remote_settings {
    url                                 = "https://github.com/example/repo.git"
    default_branch                      = "main"
    authentication_token_secret_version = "projects/example-project/secrets/git-token/versions/1"
  }
}
