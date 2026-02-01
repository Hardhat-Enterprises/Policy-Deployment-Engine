resource "google_gke_backup_backup_plan" "nc" {
  name = "nc"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/my-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
    encryption_key {
      gcp_kms_encryption_key = ""
    }
  }

  retention_policy {
    backup_delete_lock_days = 30
    backup_retain_days      = 180
  }
}

