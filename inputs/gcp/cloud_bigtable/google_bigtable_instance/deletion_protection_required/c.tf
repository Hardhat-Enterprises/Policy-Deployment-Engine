resource "google_bigtable_instance" "c" {
  project             = "PDE"
  name                = "c"
  deletion_protection = true

  cluster {
    cluster_id   = "c-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
