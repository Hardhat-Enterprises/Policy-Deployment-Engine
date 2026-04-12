resource "google_backup_dr_backup_vault" "nc" {
  project             = "tammim-shahriar"
  location            = "australia-southeast1"
  backup_vault_id     = "backup-vault-non-compliant"
  description         = "This is a second backup vault built by Terraform."
  backup_minimum_enforced_retention_duration = "100s"
  force_update        = "false"
  access_restriction  = "WITHIN_ORGANIZATION"
}
