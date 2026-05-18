resource "google_data_fusion_instance" "nc" {
  project = "gcp-project-12345"
  name   = "nc"
  region = "us-central1"
  type   = "BASIC"

  event_publish_config {
    enabled = true
    topic   = "projects/unauthorized-sandbox/topics/invalid"
  }
}