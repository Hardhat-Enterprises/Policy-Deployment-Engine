resource "google_bigtable_instance" "c_g0" {
  project             = "PDE"
  name                = "c"
  deletion_protection = true

  cluster {
    cluster_id   = "c-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
    kms_key_name = "projects/PDE/locations/australia-southeast1/keyRings/bt-kr/cryptoKeys/bt-cmek"
  }
}

resource "google_bigtable_instance" "c_g1" {
  project             = "PDE"
  name                = "c"
  deletion_protection = true

  cluster {
    cluster_id   = "c-cluster"
    zone         = "australia-southeast1-a"
    num_nodes    = 1
    storage_type = "SSD"
    kms_key_name = "projects/PDE/locations/australia-southeast1/keyRings/bt-kr/cryptoKeys/bt-cmek"
  }
}
