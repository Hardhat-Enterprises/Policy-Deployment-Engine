resource "google_gke_backup_backup_plan" "nc" {
  name     = "test-backup"  
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"  # This SHOULD trigger the australian_region_restriction

  backup_config {
    all_namespaces = false  # This SHOULD trigger comprehensive_namespace_coverage
    # Missing include_secrets
    # Missing include_volume_data  
    # Missing encryption_key
  }

  # Missing backup_schedule

  retention_policy {
    backup_retain_days = 15  # This SHOULD trigger minimum_retention_period
  }
}