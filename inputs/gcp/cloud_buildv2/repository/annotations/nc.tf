resource "google_cloudbuildv2_repository" "nc" {
  name              = "insecure-repo"
  location          = "global"
  remote_uri        = "https://github.com/untrusted/repo.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"

  annotations = {
    environment = ""
  }
}
