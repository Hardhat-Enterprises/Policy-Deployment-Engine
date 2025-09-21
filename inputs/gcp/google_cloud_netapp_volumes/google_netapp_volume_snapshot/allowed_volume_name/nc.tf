resource "google_netapp_volume_snapshot" "nc1" {
  name        = "nc1"
  location    = "us-central1"   
  volume_name = "backup-volume"
  project = "deakin-lab-123"
}