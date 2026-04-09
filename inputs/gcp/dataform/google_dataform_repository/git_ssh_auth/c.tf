# Google Dataform Repository — compliant git_ssh_auth (SSH auth properly configured)

resource "google_dataform_repository" "c" {
  provider     = google-beta
  region       = "australia-southeast1"
  name         = "c"
  display_name = "c"
  
  git_remote_settings {
    url             = "ssh://git@github.com/example/repo.git"
    default_branch  = "main"
    ssh_authentication_config {
      user_private_key_secret_version = "projects/example-project/secrets/ssh-key/versions/1"
      host_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7vbqajDhA..."
    }
  }
}
