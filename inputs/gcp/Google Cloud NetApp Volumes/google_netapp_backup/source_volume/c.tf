resource "google_netapp_backup" "c1" {
  project       = "deakin-lab-123"
  name          = "c1"
  location      = "australia-southeast2"          # Melbourne
  vault_name    = "backup-vault"
  source_volume = "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
}