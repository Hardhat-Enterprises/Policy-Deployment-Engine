resource "google_data_fusion_instance" "non_compliant_example_1" {
  project = "gcp-project-12345"
  name   = "non_compliant_example_1"
  region = "us-central1"
  type   = "BASIC"

  event_publish_config {
    enabled = false
    topic   = "projects/hardhat-prod/topics/cdf-events"
  }
}
