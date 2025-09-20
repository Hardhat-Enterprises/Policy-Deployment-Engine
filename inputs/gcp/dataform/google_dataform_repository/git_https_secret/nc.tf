# Google Dataform Repository — non-compliant git_https_secret (HTTPS token missing)

resource "google_dataform_repository" "nc" {
  provider     = google-beta
  project      = var.project
  region       = "australia-southeast1"
  name         = "nc"
  display_name = "nc"
  
  git_remote_settings {
    url             = "https://github.com/example/repo.git"
    default_branch  = "main"
    # authentication_token_secret_version intentionally omitted to fail policy
    ssh_authentication_config {
      host_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC..."
      user_private_key_secret_version = "projects/test-project/secrets/ssh-key/versions/1"
    }
  }
}
