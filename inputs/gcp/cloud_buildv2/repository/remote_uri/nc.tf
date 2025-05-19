resource "google_cloudbuildv2_repository" "nc" {
  name              = "unsecure-repo-non-compliant"
  location          = "global"
  remote_uri        = "http://untrusted.repo.git"  # ❌ insecure & non-GitHub
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
