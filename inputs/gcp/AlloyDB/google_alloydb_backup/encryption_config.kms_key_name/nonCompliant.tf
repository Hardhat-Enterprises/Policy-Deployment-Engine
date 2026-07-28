resource "google_alloydb_backup" "non_compliant_example_1" {
  location     = "us-central1"
  backup_id    = "backup-cmek-off"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-nc"
  project = "123"

  type = "ON_DEMAND"

  
}
