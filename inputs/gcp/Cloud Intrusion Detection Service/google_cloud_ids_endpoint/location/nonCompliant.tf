resource "google_cloud_ids_endpoint" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  location    = "us-central1"
  network     = "projects/fake-project-id/global/networks/fake-network"
  severity    = "LOW"
  description = "Non-compliant IDS endpoint outside the approved Australian region"
}