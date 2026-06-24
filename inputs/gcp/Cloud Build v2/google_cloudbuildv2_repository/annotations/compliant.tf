# Compliant — a single repository that satisfies every merged scenario
resource "google_cloudbuildv2_repository" "compliant_example_1" {
  project           = "c"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"

  annotations = {
    data_classification = "internal"
    environment         = "prod"
  }
}
