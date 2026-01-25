resource "google_gke_backup_restore_channel" "c" {
  name                = "c"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  description         = "Production restore channel for GKE disaster recovery. Restores to same project with CMEK encryption. Approved by Security Team on 2024-01-15."
}

