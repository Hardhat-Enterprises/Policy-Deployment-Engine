resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 90
  }

  backup_config {
    include_volume_data = true
    include_secrets     = false
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}

