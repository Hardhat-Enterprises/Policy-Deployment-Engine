resource "google_alloydb_backup" "compliant_example_1" {
  location     = "australia-southeast1"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  backup_id    = "backup-loc-allowed"
  project = "123"

}
