resource "google_gke_backup_backup_plan" "nc" {
  name     = "insecure-secrets-exposed"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = true  # SECURITY RISK: Secrets exposed in backups!
    all_namespaces = true
  }
}