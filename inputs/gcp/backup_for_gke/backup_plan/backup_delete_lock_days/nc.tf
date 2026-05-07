resource "google_gke_backup_backup_plan" "nc" {
  name = "nc"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  backup_config {
    include_volume_data = true
    include_secrets     = false
    all_namespaces      = true
  }

  retention_policy {
    backup_delete_lock_days = 5
    backup_retain_days      = 3
  }
}

