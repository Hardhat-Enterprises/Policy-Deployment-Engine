resource "google_netapp_backup_vault" "nc_test_backup_vault" {
  project  = "deakin-lab-123"
  name = "nc1"
  location = "us-west1"
  description = "Terraform created vault"
 
}