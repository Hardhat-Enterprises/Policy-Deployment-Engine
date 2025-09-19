# Google Dataform Repository — compliant (git_ssh_auth: SSH authentication configured)

resource "google_dataform_repository" "c" {
  provider = google-beta
  project  = var.project
  region   = "australia-southeast1"
  name     = "c"
  
  git_remote_settings {
    url             = "git@github.com:company/repo.git"
    default_branch  = "main"
    ssh_authentication_config {
      user_private_key_secret_version = "projects/my-project/secrets/ssh-key/versions/1"
      host_public_key                 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC..."
    }
  }
}

variable "project" {
  type = string
}

