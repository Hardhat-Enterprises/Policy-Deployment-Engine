resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast2/clusters/test-cluster"
  location = "australia-southeast2"
  
  backup_config {
    all_namespaces = true
    # These fields are MISSING - causing failures:
    include_secrets     = false  # Will fail secrets policy
    include_volume_data = false  # Will fail volume policy
    # No encryption_key block - will fail encryption policy
  }
  
  # No backup_schedule block - will fail scheduling policy
  
  retention_policy {
    backup_retain_days = 15  # Less than 30 - will fail retention policy
  }
}