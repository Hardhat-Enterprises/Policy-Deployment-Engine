resource "google_cloud_ids_endpoint" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  location    = "australia-southeast1"
  network     = "projects/fake-project-id/global/networks/fake-network"
  severity    = "LOW"
  description = "Non-compliant IDS endpoint suppressing specific threat IDs"
  threat_exceptions = ["threat-id-12345"]
}