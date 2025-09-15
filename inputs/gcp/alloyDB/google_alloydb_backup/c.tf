# AlloyDB backup that USES CMEK (kms_key_name present)
resource "google_alloydb_backup" "c" {
  location     = "us-central1"  # required
  backup_id    = "bk-cmek-ok"   # required
  cluster_name = "projects/pde-demo/locations/us-central1/clusters/cluster-1"  # required

  encryption_config {
    # Fully-qualified CryptoKey path
    kms_key_name = "projects/sec-keys-prod/locations/us-central1/keyRings/ring-a/cryptoKeys/ck-cmek-1"
  }
}
