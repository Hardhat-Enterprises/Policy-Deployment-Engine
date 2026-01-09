resource "google_gke_backup_backup_plan" "c" {
  name     = "strict-backup-plan"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    permissive_mode = false  # SECURE: Fail backup if issues encountered
    selected_applications {
      namespaced_names {
        name = "critical-app"
        namespace = "production"
      }
    }
  }
}