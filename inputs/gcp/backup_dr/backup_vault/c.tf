resource "google_backup_dr_backup_vault" "c" {
  project         = "my-gcp-project"
  location        = "australia-southeast1"
  backup_vault_id = "c"
}
