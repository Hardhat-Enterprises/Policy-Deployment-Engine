resource "google_gke_backup_restore_plan" "nc" {
  name     = "rp-volume-bindings-nc"
  project  = "PDE"
  location = "australia-southeast1"
  backup_plan = "projects/PDE/locations/australia-southeast1/backupPlans/bp1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/c1"
  restore_config {
    volume_data_restore_policy = "NO_VOLUME_DATA_RESTORATION"
    cluster_resource_restore_scope {
        all_group_kinds = true
    }
    all_namespaces = true
  }
}
