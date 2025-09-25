resource "google_gke_backup_backup_plan" "nc" {
  name     = "deactivated-backup"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/test"
  location = "australia-southeast1"
  
  backup_config {
    all_namespaces = true
  }
  
  deactivated = true  # This makes it non-compliant
}