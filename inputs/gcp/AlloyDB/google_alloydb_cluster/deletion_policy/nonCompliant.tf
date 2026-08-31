resource "google_alloydb_cluster" "non_compliant_example_1" {
  cluster_id = "non_compliant_example_1"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  deletion_policy = "DESTROY"

  initial_user {
    user     = "admin"
    password = "secure-password"
  }
}
