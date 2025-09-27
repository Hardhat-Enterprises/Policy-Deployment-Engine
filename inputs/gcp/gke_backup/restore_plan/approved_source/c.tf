resource "google_gke_backup_restore_plan" "c" {
  name        = "c"
  location    = "australia-southeast1"
  project     = "fluent-coder-468700-h4"
  backup_plan = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/production-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"

  description = "Restore plan using approved backup source"

  restore_config {
    selected_namespaces {
      namespaces = ["production", "monitoring"]
    }
    namespaced_resource_restore_mode = "FAIL_ON_CONFLICT"
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    cluster_resource_conflict_policy = "USE_EXISTING_VERSION"
  }

  labels = {
    environment     = "production"
    backup_source   = "approved"
    region         = "australia-southeast1"
  }
}