# Google Dataform Repository — non-compliant git_ssh_auth (SSH key secret & host key required)

resource "google_dataform_repository" "nc" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "git-ssh-non-compliant"
  display_name   = "nc"
  
  git_remote_settings {
    url            = "ssh://git@github.com/example/repo.git"
    default_branch = "main"
    
    ssh_authentication_config {
      user_private_key_secret_version = "projects/EX/secrets/ssh-key/versions/1"
      host_public_key                 = ""
    }
  }
}

