resource "google_gke_backup_backup_plan" "c" {
  name     = "ransomware-protected-backup"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  retention_policy {
    backup_delete_lock_days = 30   # SECURE: 30-day protection against deletion
    backup_retain_days = 180
  }
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    selected_namespaces {
      namespaces = ["production"]
    }
  }
}