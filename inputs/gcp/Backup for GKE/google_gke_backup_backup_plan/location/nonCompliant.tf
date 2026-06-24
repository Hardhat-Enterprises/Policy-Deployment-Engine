resource "google_gke_backup_backup_plan" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  cluster  = "projects/PDE/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "PDE"

  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }

  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 180
  }
}

