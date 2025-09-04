resource "google_gke_backup_backup_plan" "nc" {
  name     = "location-noncompliant-plan"
  location = "asia-southeast1"  # Non-approved location
  cluster  = "projects/fluent-coder-468700-h4/locations/asia-southeast1/clusters/my-cluster"
  
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}