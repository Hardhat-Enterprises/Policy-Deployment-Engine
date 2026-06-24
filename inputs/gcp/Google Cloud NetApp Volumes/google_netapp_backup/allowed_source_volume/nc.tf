resource "google_netapp_backup" "nc1" {
  project       = "deakin-lab-123"
  name          = "nc1"
  location      = ""          # Melbourne
  vault_name    = ""
  source_volume = ""
}