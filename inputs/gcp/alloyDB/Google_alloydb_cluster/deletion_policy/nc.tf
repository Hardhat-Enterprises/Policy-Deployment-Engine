resource "google_alloydb_cluster" "nc" {
  cluster_id = "dangerous-cluster"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  deletion_policy = "DESTROY"

  initial_user {
    user     = "admin"
    password = "weak-password"
  }
}
