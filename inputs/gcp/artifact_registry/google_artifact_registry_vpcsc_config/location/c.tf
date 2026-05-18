resource "google_artifact_registry_vpcsc_config" "c" {
  project      = "my-first-project"
  provider     = google-beta
  location     = "australia-southeast1"
  vpcsc_policy = "ALLOW"
}