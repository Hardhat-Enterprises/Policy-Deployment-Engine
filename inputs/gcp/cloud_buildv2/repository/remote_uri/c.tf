resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo-compliant"
  location          = "global"
  remote_uri        = "https://github.com/example/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
