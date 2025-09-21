resource "google_alloydb_backup" "c" {
  location     = "us-central1"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  backup_id    = "backup-cmek-on"
  encryption_config { kms_key_name = "projects/p/locations/us-central1/keyRings/r/cryptoKeys/k" }
}
