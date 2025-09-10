resource "google_netapp_backup_vault" "c_test_backup_vault" {
  project  = "deakin-lab-123"
  name = "c1"
  location = "australia-southeast2"
  description = "Terraform created vault"
 
}