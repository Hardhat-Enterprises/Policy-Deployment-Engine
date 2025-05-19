# Non-Compliant: Repository uses a non-whitelisted GCP location (europe-west9)
resource "google_cloudbuildv2_repository" "nc" {
  name              = "secure-repo-non-compliant"
  location          = "europe-west9"  # Not in the approved whitelist
  remote_uri        = "https://github.com/example/insecure.git"
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
