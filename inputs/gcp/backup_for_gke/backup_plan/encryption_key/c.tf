resource "google_gke_backup_backup_plan" "c" {
  name     = "cmek-encrypted-backups"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  backup_config {
    include_volume_data = true
    include_secrets = false
    selected_namespaces {
      namespaces = ["default", "production"]
    }
    encryption_key {
      gcp_kms_encryption_key = "projects/fluent-coder-468700-h4/locations/australia-southeast1/keyRings/backup-keyring/cryptoKeys/backup-key"
    }
  }
}