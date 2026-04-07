resource "google_artifact_registry_vpcsc_config" "nc" {
  project       = "my-first-project"
  provider      = google-beta
  location      = "us-central1"
  vpcsc_policy   = "ALLOW"
}