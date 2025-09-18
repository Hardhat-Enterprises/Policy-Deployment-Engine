resource "google_gke_backup_backup_plan" "c" {
  name          = "c"
  cluster       = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location      = "australia-southeast1"
  
  retention_policy {
    backup_retain_days = 45
  }

  backup_config {
    all_namespaces = true
  }
}