resource "google_data_fusion_instance" "c" {
  project = "gcp-project-12345"
  name   = "c"
  region = "us-central1"
  type   = "BASIC"

  event_publish_config {
    enabled = true
    topic   = "projects/hardhat-prod/topics/cdf-events"
  }
}