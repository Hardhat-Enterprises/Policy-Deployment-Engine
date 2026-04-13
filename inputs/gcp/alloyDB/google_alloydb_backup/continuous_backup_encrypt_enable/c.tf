
resource "google_alloydb_backup" "c" {
  location     = "us-central1"
  backup_id    = "alloydb-backup"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  project      = "123"
  type         = "ON_DEMAND"

  labels = {
    label = "key"
  }

  encryption_config {
    kms_key_name = "projects/project123/locations/australia-southeast-1/keyRings/test-keyring/cryptoKeys/test-key"
  }

}

