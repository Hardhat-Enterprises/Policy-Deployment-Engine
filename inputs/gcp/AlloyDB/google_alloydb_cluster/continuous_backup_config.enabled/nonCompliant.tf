resource "google_alloydb_cluster" "non_compliant_example_1" {
  location   = "us-central1"
  cluster_id = "non_compliant_example_1"
  project = "123"

  network_config {
    network = "projects/p/global/networks/prod-vpc"
  }

  continuous_backup_config {
    enabled = false
    
  }
}
