resource "google_alloydb_cluster" "compliant_example_1" {
  cluster_id = "c"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/prod-vpc"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
