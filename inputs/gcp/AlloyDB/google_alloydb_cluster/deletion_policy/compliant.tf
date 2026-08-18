resource "google_alloydb_cluster" "compliant_example_1" {
  cluster_id = "compliant_example_1"
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
