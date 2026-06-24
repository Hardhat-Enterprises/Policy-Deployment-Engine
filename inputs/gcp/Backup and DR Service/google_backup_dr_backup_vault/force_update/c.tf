resource "google_backup_dr_backup_vault" "c" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "australia-southeast1"
  backup_vault_id                            = "c"
  backup_minimum_enforced_retention_duration = "300000s"
  force_update                               = "false"
}
