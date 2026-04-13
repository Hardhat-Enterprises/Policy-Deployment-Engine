resource "google_netapp_volume_snapshot" "nc" {
  name        = "nc"
  location    = "us-central1"
  volume_name = "test-volume"
  project     = "deakin-lab-123"
}