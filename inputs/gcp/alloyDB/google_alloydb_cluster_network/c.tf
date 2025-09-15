resource "google_alloydb_cluster" "c" {
  cluster_id = "cluster-approved"
  location   = "us-central1"

  network_config {
    network = "projects/pde-demo/global/networks/prod-vpc"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
