resource "google_netapp_backup" "non_compliant_example_1" {
  project       = "deakin-lab-123"
  name          = "non_compliant_example_1"
  location      = "australia-southeast2"          # Melbourne
  vault_name    = "backup-vault"
  source_volume = ""
}
