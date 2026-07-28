resource "google_netapp_volume_snapshot" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  location    = "us-central1"   
  volume_name = "backup-volume"
  project = "deakin-lab-123"
}
