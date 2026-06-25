resource "google_bigtable_instance" "non_compliant_example_1" {
  project             = "PDE"
  name                = "non_compliant_example_1"
  deletion_protection = true

  cluster {
    cluster_id   = "nc-cluster"
    zone         = "us-central1-b"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
