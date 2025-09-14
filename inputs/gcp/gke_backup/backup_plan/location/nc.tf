resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/us-west1/clusters/test-cluster"
  location = "us-west1"
  
  backup_config {
    all_namespaces = true
  }
}