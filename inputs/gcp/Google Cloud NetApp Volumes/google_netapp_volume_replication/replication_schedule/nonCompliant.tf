resource "google_netapp_volume_replication" "non_compliant_example_1" {
  project              = "deakin-lab-123"
  name                 = "non_compliant_example_1"
  location             = "australia-southeast2"    
  volume_name          = "prod-volume"             
  replication_schedule = "DAILY"                   
}
