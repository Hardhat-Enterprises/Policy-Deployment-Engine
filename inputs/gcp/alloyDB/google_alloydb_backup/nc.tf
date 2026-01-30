
resource "google_alloydb_backup" "nc" {
  location     = "us-central1"
  backup_id    = "bk-no-cmek"
  cluster_name = "projects/pde-demo/locations/us-central1/clusters/cluster-1"

  
}
