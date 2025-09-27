resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/my-cluster"
  location = "australia-southeast1"
  project  = "fluent-coder-468700-h4"

  backup_config {
    include_volume_data = true
    include_secrets     = true
    
    encryption_key {
      gcp_kms_encryption_key = "projects/fluent-coder-468700-h4/locations/australia-southeast1/keyRings/backup-ring/cryptoKeys/backup-key"
    }
    
    all_namespaces = true
  }

  retention_policy {
    backup_delete_lock_days = 7
    backup_retain_days      = 30
    locked                  = true
  }
}