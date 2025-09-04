resource "google_gke_backup_backup_plan" "c" {
  name     = "location-compliant-plan"
  location = "us-central1"  # Approved location
  cluster  = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/my-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}