resource "google_alloydb_cluster" "nc" {
  cluster_id = "cluster-default-vpc"
  location   = "us-central1"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
