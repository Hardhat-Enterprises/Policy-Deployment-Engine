resource "google_netapp_backup_vault" "c1" {
  project  = "deakin-lab-123"
  name = "c1"
  location = "australia-southeast2"
  description = "Terraform created vault"
 
}