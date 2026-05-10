resource "google_bigtable_instance" "nc" {
  project             = "PDE"
  name                = "nc"
  deletion_protection = true

  cluster {
    cluster_id   = "nc-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
    kms_key_name = "projects/PDE/locations/us-central1/keyRings/bt-kr/cryptoKeys/bt-cmek"
  }
}
