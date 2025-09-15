resource "google_alloydb_cluster" "nc" {
  cluster_id = "cluster-abp-low"
  location   = "us-central1"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  initial_user {
    user     = "admin"
    password = "weak-pass"
  }

  # Non-compliant: retention too low (1 day)
  automated_backup_policy {
    location = "us"
    time_based_retention {
      retention_period = "86400s"
    }
  }
}
