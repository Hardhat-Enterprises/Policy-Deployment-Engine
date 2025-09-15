resource "google_alloydb_backup" "nc" {
  location     = "europe-north1"
  backup_id    = "Backup_01" # bad format on purpose
  cluster_name = "projects/pde-demo/locations/us-central1/clusters/cluster-1"
  # no encryption_config -> no CMEK
}
