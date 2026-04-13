resource "google_alloydb_cluster" "nc" {
  cluster_id = "nc"
  location   = "us-central1"
  project    = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  initial_user {
    user     = "admin"
    password = "weak-pass"
  }


  automated_backup_policy {
    location = "us"
    time_based_retention {
      retention_period = "86400s"
    }
  }
}
