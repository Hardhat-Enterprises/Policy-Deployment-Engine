resource "google_gke_backup_restore_channel" "c" {
  name                = "labeled-restore-channel"
  location            = "australia-southeast1"
  project             = var.gcp_project
  destination_project = "projects/fluent-coder-468700-h4"
  
  labels = {
    data-classification = "sensitive"      # SECURE: Data classification
    compliance         = "required"        # SECURE: Compliance tracking
    environment       = "production"       # SECURE: Environment identification
    disaster-recovery = "critical"        # SECURE: DR priority
    encryption       = "cmek-required"    # SECURE: Encryption requirement
  }
}