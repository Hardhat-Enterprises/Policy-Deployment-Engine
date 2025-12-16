resource "google_gke_backup_backup_plan" "c" {
  name     = "selective-namespace-backup"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    # SECURE: Using selected_namespaces instead of all_namespaces
    
    selected_namespaces {
      namespaces = ["production", "critical-apps"]
    }
  }
}