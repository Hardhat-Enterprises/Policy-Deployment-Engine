resource "google_alloydb_backup" "nc" {
  location     = "us-west2"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-nc"
  backup_id    = "backup-loc-deny"
}
