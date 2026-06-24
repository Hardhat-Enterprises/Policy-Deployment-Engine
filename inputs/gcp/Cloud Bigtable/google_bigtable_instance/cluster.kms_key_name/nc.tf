resource "google_bigtable_instance" "nc_g0" {
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

resource "google_bigtable_instance" "nc_g1" {
  project             = "PDE"
  name                = "nc"
  deletion_protection = true

  cluster {
    cluster_id   = "nc-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}
