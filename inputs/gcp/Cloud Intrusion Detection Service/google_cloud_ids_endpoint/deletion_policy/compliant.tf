resource "google_cloud_ids_endpoint" "compliant_example_1" {
  name        = "compliant-example-1"
  location    = "australia-southeast1"
  network     = "projects/fake-project-id/global/networks/fake-network"
  severity    = "LOW"
  description = "Compliant IDS endpoint with deletion protection"

  deletion_policy = "PREVENT"
}