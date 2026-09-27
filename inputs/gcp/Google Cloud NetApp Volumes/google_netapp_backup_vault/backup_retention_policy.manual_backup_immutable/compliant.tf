resource "google_netapp_backup_vault" "compliant_example_1" {
  project     = "deakin-lab-123"
  name        = "compliant_example_1"
  location    = "australia-southeast2"
  description = "Terraform created vault"

  backup_retention_policy {
    backup_minimum_enforced_retention_days = 7
    manual_backup_immutable                 = true
  }
}