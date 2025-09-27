resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    include_volume_data = true
    include_secrets = true
    all_namespaces = true
    
    # Non-compliant: No encryption key configured (using default Google-managed encryption)
    # encryption_key block is missing
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}