resource "google_backup_dr_backup_vault" "c" {
  project  = "PDE"
  location = "australia-southeast1"

  backup_vault_id = "c"

   access_restriction = "WITHIN_ORGANIZATION"

  backup_minimum_enforced_retention_duration = "300000s"
}
