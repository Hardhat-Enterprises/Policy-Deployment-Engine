resource "google_gke_backup_backup_plan" "nc" {
  name     = "all-namespace-backup"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true  # Backing up everything including test/dev
  }
}