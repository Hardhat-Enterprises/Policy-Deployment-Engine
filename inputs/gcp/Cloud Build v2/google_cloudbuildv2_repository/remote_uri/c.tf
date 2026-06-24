resource "google_cloudbuildv2_repository" "c_g0" {
  project           = "c"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}

resource "google_cloudbuildv2_repository" "c_g1" {
  project           = "c"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}
