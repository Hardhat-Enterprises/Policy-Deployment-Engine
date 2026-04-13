# Google Dataform Repository — non-compliant git_https_secret (HTTPS token missing)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  git_remote_settings {
    url                                 = "https://github.com/example/repo.git"
    default_branch                      = "main"
    authentication_token_secret_version = "" # Empty string - non-compliant for testing policy enforcement
  }
}
