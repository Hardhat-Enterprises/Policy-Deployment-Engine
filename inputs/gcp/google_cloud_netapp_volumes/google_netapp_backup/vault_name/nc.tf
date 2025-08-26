resource "google_netapp_backup" "nc_test_backup" {
  project       = "deakin-lab-123"
  name          = "c-test-backup"
  location      = ""          # Melbourne
  vault_name    = ""
  source_volume = "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
}