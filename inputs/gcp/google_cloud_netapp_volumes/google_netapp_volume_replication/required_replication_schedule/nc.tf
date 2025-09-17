resource "google_netapp_volume_replication" "nc1" {
  project              = "deakin-lab-123"
  name                 = "nc1"
  location             = "us-central1"             
  volume_name          = "unapproved-volume"      
  replication_schedule = "DAILY"                   
}