resource "google_netapp_volume_replication" "compliant_example_1" {
  project              = "deakin-lab-123"
  name                 = "compliant_example_1"                     
  location             = "australia-southeast2"    
  volume_name          = "prod-volume"             
  replication_schedule = "EVERY_10_MINUTES"        
}
