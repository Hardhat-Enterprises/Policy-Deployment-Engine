resource "google_gke_backup_backup_plan" "nc1" {
  name     = "unencrypted-backup-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
    # No encryption_key block - using default encryption
  }
}