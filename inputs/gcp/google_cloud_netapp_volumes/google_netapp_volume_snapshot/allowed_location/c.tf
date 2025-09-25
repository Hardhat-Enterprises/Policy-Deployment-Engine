resource "google_netapp_volume_snapshot" "c1" {
  name        = "c1"
  location    = "australia-southeast2"
  volume_name = "backup-volume"
  project = "deakin-lab-123"  
}
