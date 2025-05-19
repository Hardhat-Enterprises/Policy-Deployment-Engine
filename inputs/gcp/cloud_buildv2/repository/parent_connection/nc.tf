resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo-non-compliant"
  location          = "global"
  remote_uri        = "https://github.com/example/repo.git"
  parent_connection = "projects/demo/locations/invalid-region/connections/untrusted-connection" # Invalid format and connection
  project           = "policy-deplo"
}
