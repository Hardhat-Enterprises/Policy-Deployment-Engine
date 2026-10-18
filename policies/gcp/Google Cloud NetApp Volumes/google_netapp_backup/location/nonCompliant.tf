resource "google_netapp_backup" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = ""          # Melbourne
  vault_name    = "backup-vault"
  source_volume = "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
}
