resource "google_backup_dr_backup_vault" "nc" {
  project  = "PDE"
  location = "us-central1"

  backup_vault_id = "nc"
  
  access_restriction = "UNRESTRICTED"

  backup_minimum_enforced_retention_duration = "100000s"
}
