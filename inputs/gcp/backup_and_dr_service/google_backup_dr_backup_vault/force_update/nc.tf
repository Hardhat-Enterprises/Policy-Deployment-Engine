resource "google_backup_dr_backup_vault" "nc" {
  project             = "my-project-4418-1743628379470"
  location            = "australia-southeast1"
  backup_vault_id     = "backup-vault-non-compliant"
  description         = "This is a second backup vault built by Terraform."
  backup_minimum_enforced_retention_duration = "300000s"
  force_update        = "true"
  access_restriction  = "WITHIN_ORGANIZATION"
}
