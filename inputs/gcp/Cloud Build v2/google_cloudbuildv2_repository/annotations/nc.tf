# Non-compliant — one per scenario, each violating a different annotation
# nc1: scenario 1 — disallowed data_classification value
resource "google_cloudbuildv2_repository" "nc1" {
  project           = "nc1"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"

  annotations = {
    data_classification = "unknown"
    environment         = "prod"
  }
}

# nc2: scenario 2 — disallowed environment value
resource "google_cloudbuildv2_repository" "nc2" {
  project           = "nc2"
  location          = "australia-southeast2"
  name              = "my-repository"
  parent_connection = "my-connection"
  remote_uri        = "https://github.com/approved-org/secure-repo.git"

  annotations = {
    data_classification = "internal"
    environment         = "invalid"
  }
}
