resource "google_netapp_volume_replication" "non_compliant_example_1" {
  project              = "deakin-lab-123"
  name                 = "non_compliant_example_1"
  location             = "us-central1"             
  volume_name          = "prod-volume"             
  replication_schedule = "EVERY_10_MINUTES"        
}
