resource "google_artifact_registry_vpcsc_config" "my-config" {
  project       = "my-first-project"
  provider      = google-beta
  location      = "australia-southeast1-a"
  vpcsc_policy   = "ALLOW"
}