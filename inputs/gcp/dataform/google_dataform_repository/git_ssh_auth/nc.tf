# Google Dataform Repository — non-compliant git_ssh_auth (missing host_public_key)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"

  git_remote_settings {
    url            = "ssh://git@github.com/example/repo.git"
    default_branch = "main"
    ssh_authentication_config {
      user_private_key_secret_version = "projects/example-project/secrets/ssh-key/versions/1"
      host_public_key                 = "" # Empty string - non-compliant for testing policy enforcement
    }
  }
}
