resource "google_gke_backup_restore_plan" "nc" {
  name        = "reuse-volume-handles"
  location    = "australia-southeast1"
  project     = var.gcp_project
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    volume_data_restore_policy_bindings {
      policy      = "REUSE_VOLUME_HANDLE_FROM_BACKUP"  # SECURITY RISK: Reusing volume handles!
      volume_type = "GCE_PERSISTENT_DISK"
    }
  }
}