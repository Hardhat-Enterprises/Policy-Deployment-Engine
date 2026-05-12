resource "google_bigtable_instance" "nc" {
  project             = "PDE"
  name                = "nc"
  deletion_protection = false

  cluster {
    cluster_id   = "nc-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
