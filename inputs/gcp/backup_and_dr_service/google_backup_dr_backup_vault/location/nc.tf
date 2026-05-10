resource "google_backup_dr_backup_vault" "nc" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "us-central1"
  backup_vault_id                            = "nc"
  backup_minimum_enforced_retention_duration = "300000s"
}
