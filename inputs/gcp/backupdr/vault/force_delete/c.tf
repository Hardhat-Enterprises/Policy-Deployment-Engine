# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
provider "google-beta" {
  project = "policy-deployment-backups"
  region  = "australia-southeast1"
}

resource "google_backup_dr_backup_vault" "c" {
  provider = google-beta
  backup_vault_id = "backup-vault-c"
  location = "australia-southeast1"
  backup_minimum_enforced_retention_duration = "86400s"
  force_delete = true
}
