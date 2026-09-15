resource "google_bigtable_instance" "non_compliant_example_1" {
  project             = "PDE"
  name                = "non_compliant_example_1"
  deletion_protection = false

  cluster {
    cluster_id   = "c-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
