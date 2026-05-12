resource "google_cloudbuildv2_repository" "nc" {
  project           = "nc"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "unknown-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}