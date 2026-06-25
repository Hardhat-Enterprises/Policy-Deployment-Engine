resource "google_cloudbuildv2_repository" "non_compliant_example_1" {
  project           = "non_compliant_example_1"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "unknown-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}
