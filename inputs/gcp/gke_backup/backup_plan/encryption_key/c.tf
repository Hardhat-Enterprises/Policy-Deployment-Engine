resource "google_gke_backup_backup_plan" "c" {
  name     = "c"
  cluster  = "projects/test-project/locations/us-central1/clusters/my-cluster"
  location = "us-central1"
  project  = "test-project"
  
  backup_config {
    include_volume_data = true
    include_secrets = true
    all_namespaces = true
    
    # Compliant: Using customer-managed encryption key
    encryption_key {
      gcp_kms_encryption_key = "projects/test-project/locations/us-central1/keyRings/backup-keyring/cryptoKeys/backup-key"
    }
  }
  
  retention_policy {
    backup_retain_days = 30
  }
}