resource "google_backup_dr_backup_vault" "nc" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "australia-southeast1"
  backup_vault_id                            = "nc"
  backup_minimum_enforced_retention_duration = "300000s"
  access_restriction                         = "UNRESTRICTED"
}
