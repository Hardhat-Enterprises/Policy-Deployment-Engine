resource "google_cloudbuildv2_repository" "non_compliant_example_1" {
  project           = "nc"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/random-user/unknown-repo.git"
}

resource "google_cloudbuildv2_repository" "non_compliant_example_2" {
  project           = "nc"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "http://github.com/approved-org/secure-repo.git"
}
