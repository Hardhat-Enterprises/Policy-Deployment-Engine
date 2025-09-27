resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    all_namespaces = false  # Non-compliant: not backing up all namespaces
    # And no selected_namespaces defined - problematic!
    include_volume_data = true
    include_secrets = true
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}