resource "google_netapp_backup_vault" "non_compliant_example_1" {
  project  = "deakin-lab-123"
  name = "non_compliant_example_1"
  location = "us-west1"
  description = "Terraform created vault"
 
}
