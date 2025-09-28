# non_compliant.tf
resource "google_alloydb_backup" "nc" {
  location     = "us-central1"
  backup_id    = "backup-cmek-off"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-nc"
  project = "123"

  # Intentionally no encryption_config (CMEK disabled) → non-compliant
  type = "ON_DEMAND"

  
}
