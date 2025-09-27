resource "google_gke_backup_restore_plan" "nc" {
  name        = "nc"
  location    = "australia-southeast1"
  project     = "fluent-coder-468700-h4"
  backup_plan = "projects/external-project/locations/us-central1/backupPlans/unknown-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"

  description = "Restore plan using unapproved external backup source"

  restore_config {
    all_namespaces = true
    namespaced_resource_restore_mode = "DELETE_AND_RESTORE"
    volume_data_restore_policy = "NO_VOLUME_DATA_RESTORATION"
    cluster_resource_conflict_policy = "USE_BACKUP_VERSION"
  }

  labels = {
    environment     = "test"
    backup_source   = "external"
    region         = "us-central1"
  }
}