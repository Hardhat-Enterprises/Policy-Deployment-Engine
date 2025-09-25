resource "google_gke_backup_backup_plan" "nc" {
  name     = "test-backup"  # Not following prod naming convention
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"  # Not Australian region

  backup_config {
    all_namespaces = false  # Not comprehensive coverage
    # Missing include_secrets - will fail kubernetes_secrets_backup_enforcement
    # Missing include_volume_data - will fail persistent_volume_backup_required
    # Missing encryption_key - will fail customer_managed_encryption_required
  }

  # Missing backup_schedule - will fail mandatory_backup_scheduling

  retention_policy {
    backup_retain_days = 15  # Less than 30 - will fail minimum_retention_period_enforcement
  }
}