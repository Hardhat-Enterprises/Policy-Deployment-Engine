resource "google_gke_backup_backup_plan" "c" {
  name     = "secure-secrets-handling"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false  # SECURE: Secrets NOT included in backups
    selected_namespaces {
      namespaces = ["production", "app"]
    }
  }
}