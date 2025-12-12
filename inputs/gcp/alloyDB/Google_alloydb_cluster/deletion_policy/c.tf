resource "google_alloydb_cluster" "c" {
  cluster_id = "secure-cluster"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  deletion_policy = "RETAIN"

  initial_user {
    user     = "admin"
    password = "secure-password"
  }
}
