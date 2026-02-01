resource "google_gke_backup_restore_plan" "c" {
  name     = "rp-volume-bindings-c"
  project  = "PDE"
  location = "australia-southeast1"
  backup_plan = "projects/PDE/locations/australia-southeast1/backupPlans/bp1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/c1"
  restore_config {
    volume_data_restore_policy = "RESTORE_VOLUME_DATA_FROM_BACKUP"
    cluster_resource_restore_scope {
        all_group_kinds = true
    }
    all_namespaces = true
  }
}
