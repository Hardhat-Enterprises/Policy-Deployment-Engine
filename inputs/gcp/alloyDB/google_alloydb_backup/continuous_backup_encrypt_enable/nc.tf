resource "google_alloydb_backup" "nc" {
  location     = "us-central1"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-nc"
  backup_id    = "backup-cmek-off"
  project = "123"

}
