resource "google_gke_backup_backup_plan" "c_backup_plan" {
  name        = "backup-plan-for-channel"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/test-cluster"
  location    = "australia-southeast1"
  description = "Backup plan for backup channel testing"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}

resource "google_gke_backup_restore_channel" "c" {
  name               = "compliant-restore-channel"
  location          = "australia-southeast1"
  description       = "Compliant restore channel with proper configuration"
  
  
  labels = {
    environment = "production"
    team        = "platform"
    compliance  = "required"
  }
  destination_project = "fluent-coder-468700-h4"
}