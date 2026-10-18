resource "google_alloydb_backup" "non_compliant_example_1" {
  location     = "us-west2"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  backup_id    = "backup-loc-allowed"
  project = "123"
}
