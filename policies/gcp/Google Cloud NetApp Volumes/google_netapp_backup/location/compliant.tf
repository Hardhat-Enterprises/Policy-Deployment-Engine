resource "google_netapp_backup" "compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "compliant_example_1"
  location      = "australia-southeast2"          # Melbourne
  vault_name    = "backup-vault"
  source_volume = "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
}
