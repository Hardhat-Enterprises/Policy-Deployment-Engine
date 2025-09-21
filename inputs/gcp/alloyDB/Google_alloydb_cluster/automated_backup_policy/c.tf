resource "google_alloydb_cluster" "c" {
  cluster_id = "c"
  location   = "us-central1"

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
      retention_period = "604800s" # 7 days
    }
  }
}
