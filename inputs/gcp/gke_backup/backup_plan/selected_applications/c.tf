resource "google_gke_backup_backup_plan" "c" {
  name     = "selective-backup-plan"
  location = "us-central1"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    
    selected_applications {
      namespaced_names {
        namespace = "production"
        name      = "critical-app"
      }
    }
  }
}