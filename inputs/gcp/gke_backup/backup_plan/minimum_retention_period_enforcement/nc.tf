resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/test-cluster"
  location = "australia-southeast1"

  retention_policy {
    backup_retain_days = 15
  }

  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}