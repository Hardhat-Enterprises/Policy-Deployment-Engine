resource "google_gke_backup_backup_plan" "nc_backup_plan" {
  name        = "backup-plan-for-nc-channel"
  cluster     = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location    = "us-central1"  # Non-compliant: Not Australian region
  description = "Backup plan for non-compliant backup channel testing"
  
  backup_config {
    include_volume_data = false  # Non-compliant
    include_secrets     = false  # Non-compliant
    selected_namespaces {
      namespaces = ["default"]   # Non-compliant: Limited scope
    }
  }
}

resource "google_gke_backup_restore_channel" "nc" {
  name               = "non-compliant-restore-channel"
  location          = "us-central1"  # Non-compliant: Not Australian region
  description       = "Non-compliant restore channel for policy testing"
  
  # Missing crypto_key_name - non-compliant: No encryption
  
  labels = {
    environment = "dev"  # Non-compliant: Should be production
  }
  destination_project = "fluent-coder-468700-h4"
}