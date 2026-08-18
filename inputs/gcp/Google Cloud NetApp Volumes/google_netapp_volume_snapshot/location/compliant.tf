resource "google_netapp_volume_snapshot" "compliant_example_1" {
  name        = "compliant_example_1"
  location    = "australia-southeast2"
  volume_name = "backup-volume"
  project = "deakin-lab-123"  
}
