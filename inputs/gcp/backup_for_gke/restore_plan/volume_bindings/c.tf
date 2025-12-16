resource "google_gke_backup_restore_plan" "c" {
  name        = "secure-volume-bindings"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    volume_data_restore_policy_bindings {
      policy      = "NO_VOLUME_DATA_RESTORATION"  # SECURE: No volume data for GCE disks
      volume_type = "GCE_PERSISTENT_DISK"
    }
  }
}