resource "google_cloudbuildv2_repository" "c" {
  project           = "c"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"

  annotations = {
    environment = "prod"
  }
}