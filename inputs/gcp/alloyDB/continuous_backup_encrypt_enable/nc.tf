resource "google_alloydb_cluster" "nc" {
  location   = "us-central1"
  cluster_id = "cluster-cbk-off"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  continuous_backup_config {
    enabled = false
  
  }
}
