resource "google_netapp_backup" "c_test_backup" {
  project       = "deakin-lab-123"
  name          = "c-test-backup"
  location      = "australia-southeast2"          # Melbourne
  vault_name    = "backup-vault"
  source_volume = "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
}