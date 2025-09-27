resource "google_gke_backup_restore_plan" "nc" {
  name        = "nc"
  location    = "australia-southeast1"
  project     = "fluent-coder-468700-h4"
  backup_plan = "projects/external-project/locations/us-central1/backupPlans/unknown-plan"
  cluster     = "projects/external-project/locations/us-central1/clusters/unknown-cluster"

  description = "Insecure restore plan with dangerous settings"

  restore_config {
    # Dangerous: restore all namespaces including system ones
    all_namespaces = true

    # Dangerous: delete and restore can overwrite existing security configs
    namespaced_resource_restore_mode = "DELETE_AND_RESTORE"
    
    # Dangerous: no volume data restoration
    volume_data_restore_policy = "NO_VOLUME_DATA_RESTORATION"
    
    # Dangerous: use backup version can overwrite security settings
    cluster_resource_conflict_policy = "USE_BACKUP_VERSION"
  }

  labels = {
    environment = "test"
    team       = "unknown"
  }
}