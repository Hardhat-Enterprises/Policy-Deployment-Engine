resource "google_cloudbuildv2_repository" "non_compliant_example_1" {
  project           = "non_compliant_example_1"
  location          = "us-central1"
  name              = "non_compliant_example_1"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"
}
