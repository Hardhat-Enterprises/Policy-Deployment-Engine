resource "google_bigtable_instance" "nc" {
  project             = "PDE"
  name                = "nc"
  deletion_protection = true

  cluster {
    cluster_id   = "nc-cluster"
    zone         = "us-central1-b"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
