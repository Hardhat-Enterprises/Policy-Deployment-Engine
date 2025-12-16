resource "google_gke_backup_backup_plan" "nc" {
  name     = "overpermissive-backup"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    all_namespaces = true  # SECURITY RISK: Backing up everything including system namespaces
  }
}