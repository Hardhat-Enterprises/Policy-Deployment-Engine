resource "google_gke_backup_backup_plan" "nc1" {
  name     = "partial-backup-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = false  # Not backing up volumes - data loss risk
    include_secrets     = true
    all_namespaces      = true
  }
}