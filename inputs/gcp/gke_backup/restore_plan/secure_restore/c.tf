resource "google_gke_backup_restore_plan" "c" {
  name        = "c"
  location    = "australia-southeast1"
  project     = "fluent-coder-468700-h4"
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/production-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"

  description = "Secure restore plan for production workloads"

  restore_config {
    # Use selected namespaces instead of all_namespaces for better security
    selected_namespaces {
      namespaces = ["production", "monitoring", "ingress-nginx"]
    }

    # Use secure conflict resolution mode
    namespaced_resource_restore_mode = "FAIL_ON_CONFLICT"
    
    # Restore volume data from backup
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    
    # Use existing cluster resources for security
    cluster_resource_conflict_policy = "USE_EXISTING_VERSION"
  }

  labels = {
    environment     = "production"
    security_level  = "high"
    restore_type    = "disaster-recovery"
    team           = "platform"
  }
}