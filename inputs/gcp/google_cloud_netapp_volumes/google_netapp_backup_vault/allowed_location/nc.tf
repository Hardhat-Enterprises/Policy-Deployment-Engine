resource "google_netapp_backup_vault" "nc1" {
  project  = "deakin-lab-123"
  name = "nc1"
  location = "us-west1"
  description = "Terraform created vault"
 
}