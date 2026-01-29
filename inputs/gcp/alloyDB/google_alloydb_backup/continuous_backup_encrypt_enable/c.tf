
resource "google_alloydb_backup" "c" {
  location     = "us-central1"
  backup_id    = "alloydb-backup"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  project = "123"
  type = "ON_DEMAND"

  labels = {
    label = "key"
  }

  
}

