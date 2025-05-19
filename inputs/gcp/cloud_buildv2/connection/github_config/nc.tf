resource "google_cloudbuildv2_connection" "nc" {
  name     = "connection-github-config-missing"
  location = "global"
  project  = "policy-deplo"
  disabled = false

  #  Missing github_config block
}
