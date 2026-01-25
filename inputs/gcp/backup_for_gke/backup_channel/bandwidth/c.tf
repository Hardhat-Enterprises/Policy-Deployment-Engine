resource "google_gke_backup_backup_channel" "c" {
  name = "c"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/backup-prod"
  
  labels = {
      "environment" = "prod"
      "owner" = "platform-team"
      "cost-center" = "1234"
      "bandwidth-limit" = "50mbps"
  }
}
