resource "google_alloydb_cluster" "non_compliant_example_1" {
  cluster_id = "non_compliant_example_1"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/prod-vpc"
  }

  initial_user {
    user     = "admin"
    password = "StrongPassw0rd!"
  }

  
  automated_backup_policy {
    location = "us"
    time_based_retention {
      retention_period = "86400s"
    }
  }
}
