resource "google_netapp_backup_vault" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"
  description   = "Terraform created vault"

  backup_region = "us-central1"
}