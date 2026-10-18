resource "google_cloudbuildv2_repository" "compliant_example_1" {
  project           = "compliant_example_1"
  location          = "australia-southeast2"
  name              = "compliant_example_1"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}
