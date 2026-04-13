resource "google_netapp_volume_snapshot" "c" {
  name        = "c"
  location    = "australia-southeast2"
  volume_name = "backup-volume"
  project     = "deakin-lab-123"
}
