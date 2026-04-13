resource "google_alloydb_cluster" "nc" {
  cluster_id = "nc"
  location   = "us-central1"
  project    = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
