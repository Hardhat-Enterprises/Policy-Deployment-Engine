resource "google_bigtable_instance" "compliant_example_1" {
  project             = "PDE"
  name                = "compliant_example_1"
  deletion_protection = true

  cluster {
    cluster_id   = "c-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
