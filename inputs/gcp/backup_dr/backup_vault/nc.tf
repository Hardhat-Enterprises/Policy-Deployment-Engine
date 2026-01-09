resource "google_backup_dr_backup_vault" "nc" {
  project  = "my-gcp-project"
  location = "us-central1"

  backup_vault_id = "nc"

  
  backup_minimum_enforced_retention_duration = "100000s"
}
