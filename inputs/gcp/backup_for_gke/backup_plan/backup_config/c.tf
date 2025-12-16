resource "google_gke_backup_backup_plan" "c" {
  name     = "secure-backup-config"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true   
    include_secrets     = false  # SECURITY: Never backup secrets
    #all_namespaces      = false  # SECURITY: Principle of least privilege
    
    selected_namespaces {
      namespaces = ["production", "critical-apps"]  # SECURITY: Only backup what's needed
    }
    
    encryption_key {  # SECURITY: Customer-managed encryption
      gcp_kms_encryption_key = "projects/fluent-coder-468700-h4/locations/australia-southeast1/keyRings/backup-keyring/cryptoKeys/backup-key"
    }
  }
}