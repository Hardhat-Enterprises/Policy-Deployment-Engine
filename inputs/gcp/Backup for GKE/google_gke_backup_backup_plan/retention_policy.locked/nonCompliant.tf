resource "google_gke_backup_backup_plan" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 90
    locked                  = false
  }

  backup_config {
    include_volume_data = true
    include_secrets     = false

    selected_namespaces {
      namespaces = ["production"]
    }
  }
}
